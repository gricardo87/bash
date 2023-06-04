#!/bin/bash
# Sscript gerencia a criação e exclusão de um arquivo de swap em um sistema Linux, garantindo
# que o arquivo antigo seja removido adequadamente e substituído por um novo arquivo.
# de swap com o tamanho especificado.
# Define as variáveis de ambiente:
# ARQUIVO = localização de onde ficara o arquivo swap;
# TAMANHOSWAP = tamamho da swap em GB.

# Definir variáveis
ARQUIVO="/.swapfile";
TAMANHOSWAP="4GB";

# Verificar a existência do comando fallocate
if ! command -v fallocate >/dev/null 2>&1; then
    echo "O comando 'fallocate' não está disponível."
    echo "Você pode instalá-lo usando o seguinte comando:"
    echo "sudo apt-get install -y util-linux"
    exit 1
fi

# Remover arquivo swap antigo
sync && \
  sysctl -w vm.drop_caches=3 && \
  swapoff "${ARQUIVO}" && \
  sleep 1s && \
  rm -vf "${ARQUIVO}" && \
  sync

# Criar novo arquivo swap
fallocate -l "${TAMANHOSWAP}" "${ARQUIVO}" && \
  chmod 600 "${ARQUIVO}" && \
  mkswap "${ARQUIVO}" && \
  swapon "${ARQUIVO}"&& \
  sync
