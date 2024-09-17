#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export PASTATEMP=$(mktemp -d)

apt update && \
    apt-get install -y unzip less curl && \
    cd ${PASTATEMP} && \
    curl -o "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" && \
    unzip -q awscliv2.zip && \
    ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update && \
    cd /tmp && \
    rm -rf ${PASTATEMP}
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/* && \
    apt-get clean &&
    echo '[*] OK!'
