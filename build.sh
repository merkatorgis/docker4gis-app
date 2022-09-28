#!/bin/bash
set -e

wwwroot=$1

IMAGE=${IMAGE:-docker4gis/serve}
DOCKER_BASE=$(npx --yes docker4gis@"${DOCKER4GIS_VERSION:-latest}" base)

mkdir -p conf
cp -r "$DOCKER_BASE"/.plugins "$DOCKER_BASE"/.docker4gis conf
docker image build \
    -t "$IMAGE" .
rm -rf conf/.plugins conf/.docker4gis
