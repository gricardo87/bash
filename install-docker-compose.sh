#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

cd $(mktemp -d)
TAGDC=$(curl -s https://api.github.com/repos/docker/compose/releases/latest jq -r .tag_name)
URLDC="https://github.com/docker/compose/releases/download/${TAGDC}/docker-compose-$(uname -s)-$(uname -m)"
apt-get update && \
apt-get install jq curl -y && \
curl -sL "${URLDC}" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose
