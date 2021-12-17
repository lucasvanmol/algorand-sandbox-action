#!/bin/sh -l

configs="release beta dev nightly"

contains() {
    [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]] && exit(0) || exit(1)
}

echoerr() { printf "%s\n" "$*" >&2; }

contains configs $1
if [ $? -eq 0 ]; then
    git clone https://github.com/algorand/sandbox.git
    cd sandbox
    ./sandbox up $1 -v
    curl --fail --show-error localhost:4001/health -H "X-Algo-API-Token: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
else
    printf "Invalid config. Must be one of: %s\n" "$configs" >&2;
    exit 1
fi

