#!/usr/bin/env bash

if [[ "$1" =~ ^(release|beta|dev|nightly)$ ]]; then
    # Sandbox up
    git clone https://github.com/algorand/sandbox.git
    cd sandbox
    ./sandbox up $1 -v

    # Get mnemonic
    while read online addr addr amount malgos; do
        if [ "$online" == "[online]" ]; then
            address=$addr    
        fi
    done <<< $(./sandbox goal account list)
    mnemonic=$(./sandbox goal account export -a $address)
    mnemonic=`echo "$mnemonic" | cut -d'"' -f 2`

    echo "::set-output name=mnemonic::$mnemonic"
    exit 0
else
    printf "Invalid config. Must be one of: relase/beta/dev/nightly" >&2;
    exit 1
fi
