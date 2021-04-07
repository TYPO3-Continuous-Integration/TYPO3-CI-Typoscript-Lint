FROM composer:2
FROM bash:5
FROM php:7.4-alpine

COPY .build/entrypoint.sh /entrypoint.sh
COPY .configuration/TsLint.yml /.configuration/TsLint.yml

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=bash /usr/local/bin/bash /usr/bin/bash

RUN apk update && apk upgrade \
    && apk add bash git libxml2-dev libzip-dev zip unzip curl \
    && rm -rf /var/cache/apk/*

RUN docker-php-ext-install zip

RUN echo -e "Install helmich/typo3-typoscript-lint" \
    && composer global require helmich/typo3-typoscript-lint --prefer-dist --no-progress \
    && ln -nfs /root/.composer/vendor/helmich/typo3-typoscript-lint/typoscript-lint /usr/bin/typoscript-lint \
    && chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
