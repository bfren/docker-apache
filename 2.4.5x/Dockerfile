FROM bfren/alpine-s6:alpine3.15-4.1.0

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./2.4.5x/APACHE_BUILD /tmp/

RUN bf-install

VOLUME [ "/www" ]
