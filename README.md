#### Script para facilitar configurações no Debian 11.
#### Criado por Gabriel Ricardo
#### Update: 04/06/2023

##### Script para realizar upgrade no  sistema operacional Debian 11 para o Debian 12:

```bash
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/debian-upgrade-11-to-12.sh | bash -
```
##### Script para atualizar sistema (pacotes) Debian 11/12:
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
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/install-docker.sh | bash -
```

##### Comando para instalar o docker + kubectl + helm + minikube em uma paulada só:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/setup-minikube-debian.sh | bash -
```

##### Comando limpar ambiente docker:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/docker-clean.sh | bash -
```

##### Comando limpar ambiente minikube:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/minikube-clean.sh | bash -
```

##### Comando para instalar o containerd + kubeadmin + kubectl + helm + k8s em uma paulada só:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/setup-k8s-debian.sh | bash -
```

##### Comando instalar o awscli oficial direto do binário:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install unzip curl -y && \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
```

##### Comando instalar o agent AWS Systems Manager (amd64):
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/install-ssm-debian-amd64.sh | bash -
```
