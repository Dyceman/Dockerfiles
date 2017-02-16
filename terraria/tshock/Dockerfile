# Terraria Dockerfile for Pterodactyl Panel
FROM alpine:edge

MAINTAINER Dane Everitt <dane+docker@daneeveritt.com>

RUN apk update \
    && apk upgrade \
    && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache mono openssl perl curl \
    && adduser -D -h /home/container container

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./start.sh /start.sh

CMD ["/bin/ash", "/start.sh"]
