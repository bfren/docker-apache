FROM ghcr.io/bfren/alpine-s6:alpine3.18-5.4.10

LABEL org.opencontainers.image.source="https://github.com/bfren/docker-apache"

ARG BF_IMAGE
ARG BF_PUBLISHING
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./alpine3.18/overlay /

ENV \
    # set to 1 if you want to stop the container generating default httpd.conf at startup -
    # if you do this you'll need to provide your own using a bind point
    BF_APACHE_USE_CUSTOM_CONF=0

RUN bf-install

VOLUME [ "/www" ]
