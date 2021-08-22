FROM ubuntu:18.04

LABEL maintainer="Ztj <ztj1993@gmail.com>"

RUN apt update \
  && apt install -y wget gnupg2 \
  && wget -O - http://nuitka.net/deb/archive.key.gpg | apt-key add - \
  && echo "deb http://nuitka.net/deb/stable/bionic bionic main" > /etc/apt/sources.list.d/nuitka.list \
  && apt update \
  && apt install -y nuitka \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /srv
