FROM bfren/alpine-s6:alpine3.15-3.2.2

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./2.4.5x/APACHE_BUILD /tmp/VERSION

RUN bf-install

VOLUME [ "/www" ]
