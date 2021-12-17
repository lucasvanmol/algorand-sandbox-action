#!/bin/sh -l

git clone https://github.com/algorand/sandbox.git
cd sandbox
./sandbox up $1
retVal=$?
if [ $retVal -ne 0 ]; then
    cat ./sandbox.log
fi
exit $retVal