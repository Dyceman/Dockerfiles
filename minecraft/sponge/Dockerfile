# Minimal Minecraft Docker container for Pterodactyl Panel
FROM frolvlad/alpine-oraclejdk8:cleaned

MAINTAINER Michael Parker, <parkervcp+docker@gmail.com>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update curl ca-certificates openssl perl \
    && adduser -D -h /home/container container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./start.sh /start.sh

CMD ["/bin/ash", "/start.sh"]
