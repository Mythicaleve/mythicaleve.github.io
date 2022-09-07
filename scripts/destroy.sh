#!/bin/bash
set -e

source ./config/versioned

docker kill "$DOCKERNAME" 2>/dev/null || true
docker rm "$DOCKERNAME" 2>/dev/null || true

# If we try to remove ./docs/_site, ./docs/.jekyll* here, we might
# get permission denied, for example on CircleCI. Removing these items within
# the same container used to create them makes it more likely for this to
# work.
docker pull jekyll/minimal:4
docker run --rm \
  --volume="$PWD/docs:/srv/jekyll" \
  jekyll/minimal:4 \
  /bin/bash -c 'rm -rf /srv/jekyll/_site .jekyll*'

docker network rm "$starterkitjekyll" || echo 'docker network cannot be deleted; moving on.'

echo 'Environment destroyed.'
