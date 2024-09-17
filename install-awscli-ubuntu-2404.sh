#!/bin/bash
PastaTemp=$(mktemp -d)
apt update && \
apt-get install unzip less curl -y && \
cd ${PastaTemp} \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update && \
cd /tmp/ && \
rm -rf ${PastaTemp}
