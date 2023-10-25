FROM ubuntu:latest AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes
RUN echo "pablorc ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
RUN cat /etc/sudoers

FROM base AS image
ARG TAGS
RUN addgroup --gid 1000 pablorc
RUN adduser --gecos pablorc --uid 1000 --gid 1000 --disabled-password pablorc
USER pablorc
WORKDIR /home/pablorc

FROM image
