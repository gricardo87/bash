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
    tmux \
    mysql-client --no-install-recommends -y;

export DEBIAN_FRONTEND=noninteractive
AWSCLITMP=$(mktemp -d);
cd ${AWSCLITMP} && \
apt-get update && \
apt-get install unzip curl -y && \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install
cd /tmp/ && rm -rf ${AWSCLITMP}
apt-file update;
