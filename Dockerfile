FROM ubuntu:16.04
MAINTAINER ownCloud DevOps <devops@owncloud.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    ca-certificates \
    bash \
    vim \
    curl \
    wget \
    procps \
    apt-utils \
    apt-transport-https \
    iputils-ping \
    bzip2 \
    unzip \
    cron && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD rootfs /

ADD https://github.com/vishnubob/wait-for-it/blob/master/wait-for-it.sh /usr/bin/wait-for-it
RUN chmod a+x /usr/bin/wait-for-it

CMD ["bash"]

LABEL org.label-schema.version=latest
LABEL org.label-schema.vcs-url="https://github.com/owncloud-docker/ubuntu.git"
LABEL org.label-schema.name="ownCloud Ubuntu"
LABEL org.label-schema.vendor="ownCloud GmbH"
LABEL org.label-schema.schema-version="1.0"
