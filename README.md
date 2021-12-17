# Algorand Sandbox Action

This action spins up a private algorand network using the [algorand sandbox](https://github.com/algorand/sandbox).

## Inputs

## `config`

**Optional** Config to use with `sandbox up [config]`. One of `release`, `beta`, `dev` or `nightly`. Default `"release"`.


## Example usage

```
uses: actions/algorand-sandbox-action@v1
with:
  config: 'release'
```