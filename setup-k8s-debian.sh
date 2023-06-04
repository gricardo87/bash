#!/bin/bash -exu
export DEBIAN_FRONTEND=noninteractive
rm -vf /etc/apt/trusted.gpg.d/kubernetes-xenial.gpg

# Change to a temporary directory & Download and install Docker
#cd $(mktemp -d)
#curl -fsSL https://get.docker.com -o get-docker.sh
#sh get-docker.sh

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/containerd.gpg
#echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu kubernetes-xenial stable" >  /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y containerd.io

# Change some configurations files and change to a temporary directory & Download and install kubelet kubeadm kubectl
cd $(mktemp -d)
cat /etc/modules-load.d/k8s.conf <EOF
br_netfilter
ip_vs
ip_vs_rr
ip_vs_sh
ip_vs_wrr
nf_conntrack_ipv4
overlay
EOF

cat /etc/sysctl.d/kubernetes.conf <EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

modprobe br_netfilter ip_vs ip_vs_rr ip_vs_sh ip_vs_wrr nf_conntrack_ipv4 overlay
sysctl --system

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmour -o /etc/apt/trusted.gpg.d/kubernetes-xenial.gpg
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update && apt-get install -y apt-transport-https ca-certificates curl
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

# Autocomplete an shortkey 'k'.
echo "source <(kubectl completion bash)" >> /etc/bash.bashrc
echo 'alias k=kubectl' >> /etc/bash.bashrc
echo 'complete -o default -F __start_kubectl k' >> /etc/bash.bashrc

# Change to a temporary directory & Download and install Helm
cd $(mktemp -d)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
