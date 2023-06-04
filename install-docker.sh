#!/bin/bash
cd $(mktemp -d)
curl -fsSL https://get.docker.com -o install-docker.sh
chmod +x install-docker.sh
sh install-docker.sh
