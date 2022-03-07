#!/bin/sh

IMAGE=`cat VERSION`
APACHE=${1:-2.4.5x}

git pull || exit 1
chmod +x run.sh

docker buildx build \
    --build-arg BF_IMAGE=apache \
    --build-arg BF_VERSION=${IMAGE} \
    -f ${APACHE}/Dockerfile \
    -t apache${APACHE}-dev \
    . \
    && \
    docker run -it apache${APACHE}-dev sh
