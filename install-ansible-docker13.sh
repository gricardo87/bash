#!/bin/bash -e
# Entra em um diretório temporário criado automaticamente
cd "$(mktemp -d)"

# Evita prompts interativos durante instalações via apt
export DEBIAN_FRONTEND=noninteractive

# Define o caminho onde o ambiente virtual do Ansible será instalado
export VENV=/opt/ansible

# Atualiza os repositórios e instala dependências necessárias
# python3-venv permite criar ambientes virtuais
# python3-pip permite instalar pacotes Python
apt update && apt install -y vim sudo python3 python3-venv python3-pip

# Verifica se o diretório do ambiente virtual já existe
# Caso não exista, ele será criado
if [ ! -d "${VENV}" ]; then
    mkdir -p "${VENV}"
fi

# Cria o ambiente virtual Python no diretório definido
python3 -m venv "${VENV}"

# Atualiza o pip e instala o Ansible dentro do ambiente virtual
"${VENV}/bin/pip" install --upgrade pip ansible

# Cria links simbólicos para os principais comandos do Ansible, isso permite executar ansible globalmente no sistema
for CMD in ansible ansible-playbook ansible-galaxy ansible-doc
do
    ln -sf "${VENV}/bin/${CMD}" "/usr/local/bin/${CMD}"
done

# Exibe a versão do Ansible instalada para validação
ansible --version
