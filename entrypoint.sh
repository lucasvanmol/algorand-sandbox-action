#!/usr/bin/env bash

if [[ "$1" =~ ^(release|beta|dev|nightly)$ ]]; then
    git clone https://github.com/algorand/sandbox.git
    cd sandbox
    ./sandbox up $1 -v
    exit 0
else
    printf "Invalid config. Must be one of: relase/beta/dev/nightly" "$configs" >&2;
    exit 1
fi
