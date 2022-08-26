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
