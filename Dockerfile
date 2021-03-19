FROM composer:2
FROM bash:5
FROM php:7.4-alpine

COPY .build/entrypoint.sh /entrypoint.sh

# copy from the images into the PHP Image
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=bash /usr/local/bin/bash /usr/bin/bash

RUN apk update && apk upgrade && \
    apk add bash git jq libxml2-dev libzip-dev icu-dev curl && \
    rm -rf /var/cache/apk/*

RUN docker-php-ext-install zip

RUN echo -e "Install typo3/tailor" && \
    composer global require helmich/typo3-typoscript-lint --prefer-dist --no-progress --no-suggest

RUN ln -nfs /root/.composer/vendor/typo3/helmich/bin/typo3-typoscript-lint /usr/bin/typo3-typoscript-lint

ENTRYPOINT ["/.build/entrypoint.sh"]