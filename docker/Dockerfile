FROM debian:stretch
LABEL maintainer="Mpower Developers <dev@mpower.org>"
LABEL description="Dockerised MpowerCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
