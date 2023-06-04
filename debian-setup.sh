#!/bin/bash -exu
cd /tmp/
export DEBIAN_FRONTEND=noninteractive
apt-get update && \
    apt-get install net-tools \
    libxt6 \
    apt-file \
    libxmu6 \
    nmap \
    bash-completion \
    htop \
    rsync \
    wget \
    htop \
    build-essential \
    linux-headers-amd64 \
    vim \
    sudo \
    ca-certificates \
    curl \
    apt-transport-https \
    gnupg2 \
    sudo \
    apt-file \
    arping \
    hping3 \
    mtr-tiny \
    awscli \
    ntpdate \
    bind9-dnsutils \
    aptitude \
    zip \
    uznip \
    --no-install-recommends -y;

apt-file update;
echo "[*] Script executado com sucesso!";
