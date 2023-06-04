#!/bin/bash -exu
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)

apt-get update && \
	apt-get upgrade -y && \
	apt-get dist-upgrade -y && \
	apt-get clean -y && \
	apt-get autoremove -y && \
	apt-get autoclean -y &&  \
	sync
