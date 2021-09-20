#!/usr/bin/env bash

COMMIT_HASH=$(git show -s --format=%H)

if [ -e "./index.html" ]; then
    sed -i 's:COMMIT_HASH:'${COMMIT_HASH}':g' index.html
    exit 0
else
    exit 1
fi

