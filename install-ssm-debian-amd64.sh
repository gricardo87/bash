#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt update && \
  apt install wget -y && \
  wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb && \
  dpkg -i amazon-ssm-agent.deb
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
