#!/bin/bash
cd $(mktemp -d)
export DEBIAN_FRONTEND=noninteractive
apt-get update && \
    apt-get install net-tools \
    git \
    zstd \
    nmap \
    bash-completion \
    htop \
    rsync \
    wget \
    vim \
    sudo \
    ca-certificates \
    curl \
    apt-transport-https \
    gnupg2 \
    apt-file \
    arping \
    hping3 \
    mtr-tiny \
    ntpdate \
    bind9-dnsutils \
    aptitude \
    zip \
    tzdata \
    unzip \
    awscli --no-install-recommends -y;

apt-file update;
