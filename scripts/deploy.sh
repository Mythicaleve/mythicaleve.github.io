#!/bin/bash
set -e

./scripts/destroy.sh
./scripts/build-static-site.sh

source ./config/versioned

docker network ls | grep "$DOCKERNETWORK" || docker network create "$DOCKERNETWORK"

docker run --rm -d \
  --name "$DOCKERNAME" \
  --network "$DOCKERNETWORK" \
  -p "$DOCKERPORT":80 -v "$PWD/docs/_site":/usr/share/nginx/html:ro nginx:alpine

./scripts/uli.sh
