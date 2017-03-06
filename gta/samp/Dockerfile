FROM alpine:3.5

MAINTAINER Michael Parker, <parker@parkervcp.com>

COPY ./start.sh /start.sh

RUN adduser -D -h /home/container container \
 && chmod +x /start.sh

USER container

ENV HOME=/home/container USER=container

WORKDIR /home/container

# Install Dependencies
RUN apk update
 && apk add

CMD ["/bin/ash", "/start.sh"]
