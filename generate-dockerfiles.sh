#!/bin/bash

set -euo pipefail

docker pull bfren/alpine

BASE_REVISION="4.5.1"
echo "Base: ${BASE_REVISION}"

ALPINE_VERSIONS="3.8 3.10 3.13 3.14 3.15 3.16 3.17 3.18 edge"
for V in ${ALPINE_VERSIONS} ; do

    echo "Apache for Alpine ${V}"
    APACHE_REVISION=`cat ./alpine${V}/overlay/tmp/APACHE_REVISION`

    DOCKERFILE=$(docker run \
        -v ${PWD}:/ws \
        -e BF_DEBUG=0 \
        bfren/alpine esh \
        "/ws/Dockerfile.esh" \
        BASE_REVISION=${BASE_REVISION} \
        ALPINE_MINOR=${V} \
        APACHE_REVISION=${APACHE_REVISION}
    )

    echo "${DOCKERFILE}" > ./alpine${V}/Dockerfile

done

docker system prune -f
echo "Done."
