FROM bfren/alpine-s6:alpine3.8-3.2.3

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./2.4.4x/APACHE_BUILD /tmp/VERSION

RUN bf-install

VOLUME [ "/www" ]
