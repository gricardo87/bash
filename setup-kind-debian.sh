#!/bin/bash -exu
export DEBIAN_FRONTEND=noninteractive

# Change to a temporary directory & Download and install Docker
cd $(mktemp -d)
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Change to a temporary directory & Download and install kubectl
cd $(mktemp -d)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv ./kubectl /usr/local/bin/kubectl
# Autocomplete an shortkey 'k'.
echo "source <(kubectl completion bash)" >> /etc/bash.bashrc
echo 'alias k=kubectl' >> /etc/bash.bashrc
echo 'complete -o default -F __start_kubectl k' >> /etc/bash.bashrc

# Change to a temporary directory & Download and install Helm
cd $(mktemp -d)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Change to a temporary directory & Download and install kind
cd $(mktemp -d)
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
