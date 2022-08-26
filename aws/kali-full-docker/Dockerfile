FROM docker.io/kalilinux/kali-rolling
LABEL maintainer="nima"
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y
RUN apt upgrade -y
RUN apt dist-upgrade -y
RUN apt autoremove -y
RUN apt clean -y
RUN apt update -y
RUN apt install -y kali-tools-top10
RUN apt update -y
RUN apt install -f -y
RUN apt --fix-broken install -y
RUN apt --fix-missing install -y
RUN apt autoremove -y
RUN apt dist-upgrade -y
RUN apt -y full-upgrade -y
RUN dpkg --configure -a
RUN apt --fix-broken install -y
RUN apt install -f -y
RUN apt autoremove -y
RUN apt full-upgrade -y
RUN apt-get -qq update && apt-get -qq dist-upgrade && apt-get install -qq -y --no-install-recommends \
    git \
    openssh-client \
    ca-certificates \
    curl \
    p7zip \
    build-essential \
    pkg-config \
    libgl1-mesa-dev \
    libsm6 \
    libice6 \
    libxext6 \
    libxrender1 \
    libfontconfig1 \
    && apt-get -qq clean
RUN apt update -y
RUN apt-get -qq update && apt-get install -qq kali-linux-default
# RUN apt-get -qq update && apt-get install -qq kali-linux-large
# RUN apt-get -qq update && apt-get install -qq kali-linux-everything
# RUN apt-get -qq update && apt-get install -qq kali-linux-nethunter
