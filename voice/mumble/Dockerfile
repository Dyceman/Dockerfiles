# Dockerfile for Mumble on Pterodactyl Panel
FROM alpine:3.4

MAINTAINER Dane Everitt <dane+docker@daneeveritt.com>

RUN apk update \
    && apk upgrade \
    && apk add --update curl ca-certificates openssl perl \
    && adduser -D -h /home/container container

USER container
ENV USER container
ENV HOME /home/container
ENV MUMBLE_VERSION 1.2.16

WORKDIR /home/container

COPY ./start.sh /start.sh

CMD ["/bin/ash", "/start.sh"]
