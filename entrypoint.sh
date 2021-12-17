#!/bin/sh -l

git clone https://github.com/algorand/sandbox.git
cd sandbox
./sandbox up $1 -v
exit 0