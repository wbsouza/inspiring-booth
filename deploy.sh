#!/usr/bin/env bash

set -x

COMMIT_HASH=$1
if [ "${COMMIT_HASH}" == "" ]; then
  COMMIT_HASH=$(git show -s --format=%H)
  echo "Using COMMIT_HASH from the git command: ${COMMIT_HASH}"
else
  echo "Using COMMIT_HASH from the command-line argument: ${COMMIT_HASH}"
fi


if [ -e "./src/index.html" ]; then
  sed -i 's:COMMIT_HASH:'${COMMIT_HASH}':g' ./src/index.html
  # enforcing surge installation
  npm install --global surge
  surge --project ./src --domain "${SURGE_APP_NAME:-inspiring-booth}.surge.sh"
  exit 0
else
  echo "The file src/index.html does not exist!"
  exit 1
fi
