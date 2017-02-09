FROM centos:7

MAINTAINER your name here, <email@address.com>

COPY ./start.sh /start.sh

RUN adduser -D -h /home/container container \
 && chmod +x /start.sh

USER container

ENV HOME /home/container

WORKDIR /home/container

# Install Dependencies
RUN yum update -y
 && yum install -y 

CMD ["/bin/bash", "/start.sh"]
