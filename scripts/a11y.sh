#!/bin/bash
#
# Run accessitility tests.
#
set -e

if [ ! -f ./do-not-commit/dom-captures/after-click.html ]; then
  >&2 echo 'Please run ./scripts/end-to-end-tests.sh first to get DOM captures'
  >&2 echo 'of internal pages.'
  exit 1
fi

source ./config/versioned

T=30
echo ""
echo "Threshold $T"
docker run --rm --network "$DOCKERNETWORK" dcycle/pa11y:2 http://"$DOCKERNAME"/index.html -T "$T"

echo 'If this script passes, that means the number of errors is below the allowed threshold.'
