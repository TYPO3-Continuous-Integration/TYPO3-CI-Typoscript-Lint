#!/bin/sh -l

### Function Header ###########################################################
Header() {
  ##########
  # Prints #
  ##########
  echo "---------------------------------------------"
  echo "-- GitHub Actions TYPO3 Typoscript Linter ---"
  echo " - Image Creation Date:[${BUILD_DATE}]"
  echo " - Image Revision:[${BUILD_REVISION}]"
  echo " - Image Version:[${BUILD_VERSION}]"
  echo "---------------------------------------------"
  echo "---------------------------------------------"
  echo "TYPO3 Typoscript Linter source code can be found at:"
  echo " - https://github.com/TYPO3-Continuous-Integration/TYPO3-CI-Typoscript-Lint"
  echo "---------------------------------------------"
}

### Function Lint #############################################################
Lint() {
  ##########
  # Prints #
  ##########
  echo "---------------------------------------------"
  echo "-- Running lint... ---"
  echo "---------------------------------------------"
  typoscript-lint -c TsLint.yml --ansi -n --fail-on-warnings -vvv ./Configuration/TypoScript
}

#### Function Footer ###########################################################
Footer() {
  ##########
  # Prints #
  ##########
  echo "----------------------------------------------"
  echo "----------------------------------------------"
  echo "The script has completed"
  echo "----------------------------------------------"
  echo "----------------------------------------------"
}

################################################################################
############################### MAIN ###########################################
################################################################################

##########
# Header #
##########
Header

##########
# Lint #
##########
Lint

##########
# Footer #
##########
Footer