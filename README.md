# Algorand Sandbox Action

This action spins up a private algorand network using the [algorand sandbox](https://github.com/algorand/sandbox).

## Inputs

### `config`

**Optional** Config to use with `sandbox up $CONFIG`. One of `release`, `beta`, `dev` or `nightly` (default `"release"`).

## Outputs

### `mnemonic`

Mnemonic of an account that has some algos in it, that can be used to fund test transactions.

## Example usage


```
- name: Create sandbox
  uses: lucasvanmol/algorand-sandbox-action@v1
  with:
    config: release
```

### Custom config

```
- name: Create sandbox
  uses: lucasvanmol/algorand-sandbox-action@v1
  with:
    config: path/to/config.file
```

### Docker layer caching

The sandbox initial start up is quite slow because it needs to build all the docker images. It's therefore recommened to use the `action-docker-layer-caching` action to cache docker layers and speed up subsequent runs. When using a custom config, however, a new cache must be created when the config file changes, or the cached docker layers will misbehave. A new cache is created using hashFiles() to check for any file changes.

```
on: [push]

env:
  CONFIG: .github/workflows/sandbox/config.custom
  GENESIS: .github/workflows/sandbox/genesis/genesis.json

jobs:
  algorand-sandbox-job:
    runs-on: ubuntu-latest
    name: Test sandbox
    steps:    
      - name: Check cache for Docker layers
        uses: satackey/action-docker-layer-caching@v0.0.11
        # Ignore the failure of a step and avoid terminating the job.
        continue-on-error: true
        with:
          key: docker-layer-caching-${{ github.workflow }}-${{ hashFiles(env.CONFIG, env.GENESIS) }}-{hash}
          restore-keys: docker-layer-caching-${{ github.workflow }}-${{ hashFiles(env.CONFIG, env.GENESIS) }}-
      - name: Setup sandbox
        id: sandbox
        uses: lucasvanmol/algorand-sandbox-action@v1
        with:
          config: ${{ env.CONFIG }}
```