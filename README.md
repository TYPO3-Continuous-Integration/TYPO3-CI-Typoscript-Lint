# TYPO3 Typoscript Lint Github Action

This action lints typoscript code of your TYPO3 extension.

## Inputs

### `Files`

Files you want to lint. Default `./Configuration/TypoScript`.

### `ConfigFile`

Files you want to lint. Default `/.configuration/TsLint.yml`.

## Example usage

```
uses: typo3-continuous-integration/typo3-ci-typoscript-lint@v1
with:
  files: './Configuration/Typoscript'
  config_file: '/.configuration/TsLint.yml'
```
