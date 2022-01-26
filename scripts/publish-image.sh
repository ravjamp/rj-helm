#!/usr/bin/env bash
set -e

APP_IMAGE_PATH="${APP_IMAGE_PATH}"
# Example: APP_IMAGE_PATH="node-java-base-image/Dockerfile"

VERSION="${VERSION}"
# Example: VERSION=latest

REPO="${REPO}"
# Example: REPO="docker.binrepo.vtxdev.net/cse-node-base-image/action-node-java"

echo "build version ${VERSION}"

docker build \
  -f ${APP_IMAGE_PATH} \
  -t ${REPO}:$VERSION \
  --no-cache .

## To run from github action
jfrog rt dp ${REPO}:$VERSION docker --build-name=docker-build --build-number=$VERSION

## Docker remove image
docker rmi ${REPO}:$VERSION

## Docker clean up
#docker system prune -a --volumes