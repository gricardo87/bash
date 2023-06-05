#!/bin/bash -exu
export DEBIAN_FRONTEND=noninteractive
rm -fv /etc/modprobe.d/kubernetes.conf
rmdir /etc/modprobe.d/
# Change to a temporary directory & Download and install docker/containerd
cd $(mktemp -d)
curl -fsSL https://get.docker.com -o install-docker.sh
chmod +x install-docker.sh
sh install-docker.sh
mkdir -p /etc/containerd 
containerd config default > /etc/containerd/config.toml
cp /etc/containerd/config.toml /etc/containerd/config.toml.orig
sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
systemctl enable containerd 
systemctl restart containerd

# Change some configurations files and change to a temporary directory & Download and install kubelet kubeadm kubectl
cd $(mktemp -d)
mkdir -p /etc/modules-load.d/ /etc/sysctl.d/ 2>&-

cat << EOF > /etc/modules-load.d/kubernetes.conf
"br_netfilter
ip_vs
ip_vs_rr
ip_vs_sh
ip_vs_wrr
nf_conntrack_ipv4
overlay"
EOF

cat << EOF > /etc/sysctl.d/kubernetes.conf
"net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1"
EOF

modprobe br_netfilter ip_vs ip_vs_rr ip_vs_sh ip_vs_wrr nf_conntrack_ipv4 overlay
sysctl -p

# Change to a temporary directory & Download and install k8s (kubelet kubeadm kubectl)
cd $(mktemp -d)
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmour > /etc/apt/trusted.gpg.d/kubernetes-xenial.gpg
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y apt-transport-https ca-certificates curl
apt-get install -y kubelet kubeadm kubectl etcd-client
apt-mark hold kubelet kubeadm kubectl
kubeadm config images pull

# Change to a temporary directory & Download and install Helm
cd $(mktemp -d)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Autocomplete an shortcut 'k'.
echo "source <(kubectl completion bash)" >> /etc/bash.bashrc
echo 'alias k=kubectl' >> /etc/bash.bashrc
echo 'complete -o default -F __start_kubectl k' >> /etc/bash.bashrc
