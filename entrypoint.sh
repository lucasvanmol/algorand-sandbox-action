#!/usr/bin/env bash

git clone https://github.com/algorand/sandbox.git
cd sandbox
if [[ "$1" =~ ^(release|beta|dev|nightly)$ ]]; then
    ./sandbox up $1 -v
else
    cp /github/workspace/$1 config.custom
    source config.custom

    NETWORK_DIR="$(dirname "${NETWORK_GENESIS_FILE}")"
    CONFIG_DIR="$(dirname "${1}")"

    mkdir -p $NETWORK_DIR
    cp /github/workspace/$CONFIG_DIR/$NETWORK_GENESIS_FILE $NETWORK_GENESIS_FILE

    ./sandbox up custom -v
fi
exit 0
