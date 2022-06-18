#!/bin/bash

set -euo pipefail

docker pull bfren/alpine

BASE_REVISION="4.3.1"
echo "Base: ${BASE_REVISION}"

APACHE_VERSIONS="2.4.4x 2.4.5x"
for V in ${APACHE_VERSIONS} ; do

    echo "Apache ${V}"
    ALPINE_MINOR=`cat ./${V}/ALPINE_MINOR`

    DOCKERFILE=$(docker run \
        -v ${PWD}:/ws \
        -e BF_DEBUG=0 \
        bfren/alpine esh \
        "/ws/Dockerfile.esh" \
        BASE_REVISION=${BASE_REVISION} \
        ALPINE_MINOR=${ALPINE_MINOR} \
        APACHE_MINOR=${V}
    )

    echo "${DOCKERFILE}" > ./${V}/Dockerfile

done

docker system prune -f
echo "Done."
