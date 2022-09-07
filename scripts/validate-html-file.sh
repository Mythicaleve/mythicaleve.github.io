#!/bin/bash
#
# Validate single HTML file.
#
set -e

if [ -z "$1" ]; then
  >&2 echo "Please provide a file name such as ./docs/index.html"
  exit 1
fi

FILE="$1"

echo ""
echo "*** Validating HTML on file $FILE ***"
echo ""
docker run --rm -v "$(pwd)":/code dcycle/html-validate:2 --drop-empty-elements no "$FILE"
#
# echo ""
# echo "*** Done validating HTML on file $1 ***"
# echo ""
