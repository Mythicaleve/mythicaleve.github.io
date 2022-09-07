#!/bin/bash
#
# Lint JavaScript.
#
set -e

echo ""
echo "Linting JavaScript using"
echo "https://github.com/dcycle/docker-js-lint"
echo ""
docker run --rm -v "$(pwd)"/docs/js:/app/code dcycle/js-lint:2 .
