FROM bfren/alpine-s6:alpine3.8-4.1.1

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 80

COPY ./overlay /
COPY ./2.4.4x/overlay /

RUN bf-install

VOLUME [ "/www" ]
