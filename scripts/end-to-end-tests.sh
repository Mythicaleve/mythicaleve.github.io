#!/bin/bash
#
# Run end-to-end tests and keep track of markup and screenshots.
#

set -e

source ./config/versioned

echo 'Running our tests'
docker run -e DOMAIN="$DOCKERNAME" \
  --rm -v "$(pwd)"/tests/browser-tests:/app/test \
  --network "$DOCKERNETWORK" \
  -v "$(pwd)"/do-not-commit/screenshots:/artifacts/screenshots \
  -v "$(pwd)"/do-not-commit/dom-captures:/artifacts/dom-captures \
  dcycle/browsertesting:4
