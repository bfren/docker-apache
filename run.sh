#!/bin/sh

VERSION=`cat VERSION`

git pull || exit 1
chmod +x run.sh

docker buildx build \
    --build-arg BF_IMAGE=apache \
    --build-arg BF_VERSION=${VERSION} \
    -f ${1:-2.4.5x}/Dockerfile \
    -t apache-dev \
    . \
    && \
    docker run -it apache-dev sh
