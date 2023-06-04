#### Script para facilitar configurações no Debian 11.
#### Criado por Gabriel Ricardo
#### Update: 04/06/2023

##### Script para atualizar sistema Debian 11:

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -s https://raw.githubusercontent.com/gricardo87/bash/main/upgrade.sh | bash -
```
##### Script para instalar principais ferramentas cli para servers (ou não):

```bash
export DEBIAN_FRONTEND=noninteractive
cd /tmp/
apt-get update && \
apt-get install curl -y && \
curl -s https://raw.githubusercontent.com/gricardo87/bash/main/debian-setup.sh | bash -
```
