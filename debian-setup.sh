#!/bin/bash
cd $(mktemp -d)
export DEBIAN_FRONTEND=noninteractive
apt-get update && \
    apt-get install net-tools \
    libxt6 \
    git \
    zstd \
    openssh-server \
    apt-file \
    libxmu6 \
    nmap \
    bash-completion \
    htop \
    rsync \
    wget \
    build-essential \
    linux-headers-amd64 \
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
    unzip \
    tmux \
    --no-install-recommends -y;

apt-file update;
systemctl restart dbus
systemctl daemon-reload

echo "[*] Script executado com sucesso!";
