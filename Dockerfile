FROM ubuntu:20.04

LABEL maintainer="Ztj <ztj1993@gmail.com>"

RUN apt update \
  && apt install -y wget gnupg2 \
  && mkdir -p /root/.local/share/Nuitka/appimagetool-x86_64.AppImage/x86_64/12 \
  && cd /root/.local/share/Nuitka/appimagetool-x86_64.AppImage/x86_64/12 \
  && wget https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage \
  && chmod +x appimagetool-x86_64.AppImage \
  && wget -O - http://nuitka.net/deb/archive.key.gpg | apt-key add - \
  && echo "deb http://nuitka.net/deb/stable/focal focal main" > /etc/apt/sources.list.d/nuitka.list \
  && apt update \
  && apt install -y nuitka \
  && apt install -y python3-pip \
  && rm -rf /var/lib/apt/lists/*
