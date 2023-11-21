#### Script para facilitar configurações no Debian 12.

![image](https://github.com/gricardo87/bash/assets/4189536/af1ba9f1-cdd4-4e50-8992-64fda281c11a)

#### Criado por Gabriel Ricardo
#### Update: 17/06/2023

##### Script para realizar upgrade no  sistema operacional Debian 11 para o Debian 12:

```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/debian-upgrade-11-to-12.sh | bash -
```
##### Script para atualizar sistema (pacotes) Debian 11/12:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/upgrade.sh | bash -
```
##### Script para instalar principais ferramentas cli para servers AWS EC2:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/debian-setup-cloud.sh | bash -
```
##### Script para instalar principais ferramentas cli para servers (ou não):
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
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

##### Comando para instalar o docker + kubectl + helm + kind em uma paulada só:
```bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/setup-kind-debian.sh | bash -
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

##### Comando para ativar a execução do arquivo /etc/rc.local no boot do Linux:
```bash
cd $(mktemp -d)
if [ -f "/etc/centos-release" ]; then
    dnf install curl -y
elif [ -f "/etc/debian_version" ]; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install curl -y
fi
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/enable-rclocal.sh | bash -
```

##### Script agrupado para colocar no user-data da EC2 para ela subir já atualizada e com ferramentas basicas:
```bash
#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
apt-get install curl -y && \
curl -fsSL https://raw.githubusercontent.com/gricardo87/bash/main/user-data-ec2.sh | bash -
```
