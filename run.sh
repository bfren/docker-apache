#!/bin/sh

IMAGE=`cat VERSION`
ALPINE=${1:-3.17}

docker buildx build \
    --build-arg BF_IMAGE=apache \
    --build-arg BF_VERSION=${IMAGE} \
    -f ${ALPINE}/Dockerfile \
    -t apache-alpine${ALPINE}-dev \
    . \
    && \
    docker run -it apache-alpine${ALPINE}-dev sh
