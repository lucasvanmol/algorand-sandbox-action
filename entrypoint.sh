#!/usr/bin/env bash

if [[ "$1" =~ ^(release|beta|dev|nightly)$ ]]; then
    git clone https://github.com/algorand/sandbox.git
    cd sandbox
    ./sandbox up $1 -v
    sleep 1
    curl --fail --show-error localhost:4001/health -H "X-Algo-API-Token: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
else
    printf "Invalid config. Must be one of: relase/beta/dev/nightly" "$configs" >&2;
    exit 1
fi
