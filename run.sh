#!/bin/bash
set -e

IMAGE=$IMAGE
CONTAINER=$CONTAINER
DOCKER_ENV=$DOCKER_ENV
RESTART=$RESTART
NETWORK=$NETWORK
FILEPORT=$FILEPORT
VOLUME=$VOLUME

# Use fileport/$DOCKER_USER instead of fileport/$DOCKER_USER/$repo.
FILEPORT=$FILEPORT/..
mkdir -p "$FILEPORT"

docker container run --restart "$RESTART" --name "$CONTAINER" \
	-e DOCKER_ENV="$DOCKER_ENV" \
	--mount type=bind,source="$FILEPORT",target=/fileport \
	--network "$NETWORK" \
	-d "$IMAGE"
