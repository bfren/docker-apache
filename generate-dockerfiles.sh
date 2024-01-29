#!/bin/bash

set -euo pipefail

docker pull bfren/alpine

BASE_VERSION="5.1.3"
echo "Base: ${BASE_VERSION}"

ALPINE_EDITIONS="3.15 3.16 3.17 3.18 3.19"
for V in ${ALPINE_EDITIONS} ; do

    echo "Apache for Alpine ${V}"
    APACHE_REVISION=`cat ./alpine${V}/overlay/tmp/APACHE_REVISION`

    DOCKERFILE=$(docker run \
        -v ${PWD}:/ws \
        -e BF_DEBUG=0 \
        bfren/alpine esh \
        "/ws/Dockerfile.esh" \
        BASE_VERSION=${BASE_VERSION} \
        ALPINE_EDITION=${V} \
        APACHE_REVISION=${APACHE_REVISION}
    )

    echo "${DOCKERFILE}" > ./alpine${V}/Dockerfile

done

docker system prune -f
echo "Done."
