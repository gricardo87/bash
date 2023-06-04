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

# Change to a temporary directory & Download and install Helm
cd $(mktemp -d)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Change to a temporary directory & Download and install minikube
cd $(mktemp -d)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
