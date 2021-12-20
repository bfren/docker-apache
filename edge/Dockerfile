FROM bfren/alpine-s6:alpineedge-3.2.0

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./edge/APACHE_BUILD /tmp/VERSION

RUN bf-install

VOLUME [ "/www" ]
