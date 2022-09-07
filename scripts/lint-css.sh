#!/bin/bash
#
# Lint CSS.
#
set -e

echo ""
echo "Linting CSS using"
echo "https://github.com/dcycle/docker-css-lint"
echo ""
docker run --rm -v "$(pwd)"/docs/css:/app/code dcycle/css-lint:1 --ignore=order-alphabetical .
