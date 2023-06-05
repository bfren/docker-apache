FROM bfren/alpine-s6:alpine3.8-4.5.2

LABEL org.opencontainers.image.source="https://github.com/bfren/docker-apache"

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

ENV \
    # set to 1 if you want to stop the container generating default httpd.conf at startup -
    # if you do this you'll need to provide your own using a bind point
    APACHE_USE_CUSTOM_CONF=0

COPY ./overlay /
COPY ./alpine3.8/overlay /

RUN bf-install

VOLUME [ "/www" ]
