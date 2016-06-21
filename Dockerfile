FROM alpine:latest
MAINTAINER Alexis Horgix Chotard <alexis.horgix.chotard@gmail.com>

ENV VERSION 2016.3.1
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update --update-cache upgrade \
    && apk add \
        py-pip \
        python-dev \
        ca-certificates \
        swig \
        openssl \
        gcc \
        g++ \
        libc-dev \
    && update-ca-certificates \
    && pip install --upgrade pip
RUN wget https://github.com/saltstack/salt/archive/v${VERSION}.tar.gz \
    && tar xzf v${VERSION}.tar.gz \
    && pip install ./salt-${VERSION}/

# Volumes

VOLUME ['/etc/salt', '/var/cache/salt', '/var/logs/salt', '/etc/salt', '/srv/salt']

## Add Run Fil# 4505 = Salt Pub ; 4506 = Salt Req
EXPOSE 4505 4506
