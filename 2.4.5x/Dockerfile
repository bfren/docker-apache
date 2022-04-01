FROM bfren/alpine-s6:alpine3.15-4.2.5

LABEL org.opencontainers.image.source="https://github.com/bfren/docker-apache"

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./2.4.5x/overlay /

RUN bf-install

VOLUME [ "/www" ]
