#!/bin/bash
#
# Validate all HTML files.
#
set -e

echo ""
echo "Validating HTML using"
echo "https://github.com/dcycle/docker-html-validate"
echo ""
echo "** If this fails, please run ./scripts/deploy.sh first! **"
echo ""
mkdir -p ./do-not-commit/dom-captures
for root in ./docs/_site ./do-not-commit/dom-captures; do
  for i in $(find "$root" -name *.html); do
    ./scripts/validate-html-file.sh "$i"
  done
done
echo ""
echo "Done validating HTML!"
echo ""
