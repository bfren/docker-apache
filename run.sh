#!/bin/sh

IMAGE=`cat VERSION`
ALPINE=${1:-3.21}

docker buildx build \
    --load \
    --progress plain \
    --build-arg BF_IMAGE=apache \
    --build-arg BF_VERSION=${IMAGE} \
    -f alpine${ALPINE}/Dockerfile \
    -t apache-alpine${ALPINE}-dev \
    . \
    && \
    docker run -it -e BF_DEBUG=1 apache-alpine${ALPINE}-dev sh
