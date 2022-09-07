#!/bin/bash
#
# Build the static site in ./docs.
#
set -e

echo '=> Build the Jekyll site.'
# This is required on CircleCI to avoid https://github.com/jekyll/jekyll/issues/7591
touch ./docs/.jekyll-metadata
# On CircleCI, ./docs/.jekyll-metadata, when the container tries to write to
# ./docs/.jekyll-metadata during an incremental build, it does so using the
# "ubuntu" user, which, on the host, is "other". Therefore, "other" (o) needs
# "write" (+w) access to this file.
chmod o+w ./docs/.jekyll-metadata
mkdir -p ./docs/.jekyll-cache
mkdir -p ./docs/_site
# If you change the image here also change it in ./scripts/deploy.sh
docker run --rm \
  --volume="$PWD/docs:/srv/jekyll" \
  jekyll/minimal:4 \
  jekyll build --trace --incremental

./scripts/uli.sh
