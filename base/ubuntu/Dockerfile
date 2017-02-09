FROM ubuntu:15.10

MAINTAINER your name here, <email@address.com>

COPY ./start.sh /start.sh

RUN useradd -m -d /home/container container
 && chmod +x /start.sh

USER container

ENV HOME /home/container

WORKDIR /home/container

# Install Dependencies
RUN apt-get update
 && apt-get install -y 

CMD ["/bin/bash", "/start.sh"]
