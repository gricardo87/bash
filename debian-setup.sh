#!/bin/bash
cd $(mktemp -d)
export DEBIAN_FRONTEND=noninteractive
apt-get update && \
    apt-get install net-tools \
    libxt6 \
    git \
    zstd \
    resolvconf \
    openssh-server \
    apt-file \
    libxmu6 \
    gdisk \
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
    linux-headers-amd64 \
    build-essential \
    ca-certificates \
    curl \
    apt-transport-https \
    gnupg2 \
    sudo \
    apt-file \
    arping \
    hping3 \
    mtr-tiny \
    ntpdate \
    bind9-dnsutils \
    aptitude \
    zip \
    unzip \
    --no-install-recommends -y;

apt-file update;
echo "[*] Script executado com sucesso!";
