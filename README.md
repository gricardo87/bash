#### Script para facilitar configurações no Debian 11.
#### Criado por Gabriel Ricardo
#### Update: 04/06/2023

##### Script para atualizar sistema Debian 11:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/upgrade.sh | bash -
```
##### Script para instalar principais ferramentas cli para servers (ou não):

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/debian-setup.sh | bash -
```

##### Comando para instalar o docker em uma paulada só:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/install-docker.sh | bash -
```
##### Comando para instalar o docker + kubectl + helm + minikube em uma paulada só:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/

##### Comando para instalar o docker + kubeadmin + kubectl + helm + minikube em uma paulada só:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/setup-minikube-debian.sh | bash -
```

##### Comando limpar ambiente docker:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/docker-clean.sh | bash -
```


##### Comando limpar ambiente minikube:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/minikube-clean.sh | bash -
```

##### Comando para instalar o containerd + kubeadmin + kubectl + helm + k8s em uma paulada só:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/setup-k8s-debian.sh | bash -
