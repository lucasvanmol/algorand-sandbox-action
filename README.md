# Algorand Sandbox Action

This action spins up a private algorand network using the [algorand sandbox](https://github.com/algorand/sandbox).

## Inputs

### `config`

**Optional** Config to use with `sandbox up $CONFIG`. One of `release`, `beta`, `dev` or `nightly` (default `"release"`).


## Example usage

The sandbox initial start up is quite slow because it needs to build all the docker images. It's therefore recommened to use the `action-docker-layer-caching` action to cache docker layers and speed up subsequent runs. 

```
- name: Check cache for Docker layers
  uses: satackey/action-docker-layer-caching@v0.0.11
  # Ignore the failure of a step and avoid terminating the job.
  continue-on-error: true
- name: Create sandbox
  uses: lucasvanmol/algorand-sandbox-action@v1
  with:
    config: 'release'
```