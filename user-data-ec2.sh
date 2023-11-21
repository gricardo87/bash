#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

## upgrade
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/upgrade.sh | bash -

## install some tools
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/debian-setup-cloud.sh | bash -

## enable Old but Gold rc.local
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/enable-rclocal.sh | bash -
