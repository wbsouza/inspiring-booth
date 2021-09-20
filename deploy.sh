#!/usr/bin/env bash

# Bash strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o nounset   # Using an undefined variable is fatal
set -o errexit   # A sub-process/shell returning non-zero is fatal
set -o pipefail  # If a pipeline step fails, the pipelines RC is the RC of the failed step
#set -o xtrace    # Output a complete trace of all bash actions; uncomment for debugging

COMMIT_HASH=$(git show -s --format=%H)

if [ -e "./src/index.html" ]; then
  sed -i 's:COMMIT_HASH:'${COMMIT_HASH}':g' ./src/index.html
  # enforcing surge installation
  npm install --save-dev surge
  ./node_modules/surge/lib/cli.js --project ./src --domain "${SURGE_APP_NAME:-inspiring-booth}.surge.sh"
  exit 0
else
  echo "The file src/index.html does not exist!"
  exit 1
fi
