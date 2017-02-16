# +-----------------------------------+
# | Official Pterodactyl Docker Image |
# |         Minecraft: BungeeCord     |
# +-----------------------------------+
# |       https://pterodactyl.io      |
# +-----------------------------------+
FROM java:openjdk-8-jre-alpine

MAINTAINER parkervcp, <parker@parkervcp.com>

COPY ./start.sh /start.sh

RUN adduser -D -h /home/container container \
 && apk update \
 && apk add curl \
 && chmod +x /start.sh

USER container

ENV HOME=/home/container USER=container

WORKDIR /home/container

CMD ["/bin/ash", "/start.sh"]
