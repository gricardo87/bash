#!/bin/bash
# Atualizando os repositórios
apt-get update && \
    apt-get install -y \
    net-tools \  # Pacote contendo utilitários de rede, como ifconfig e netstat
    libxt6 \  # Biblioteca necessária para alguns aplicativos que usam a camada de extensão X Toolkit (XT)
    libxmu6 \  # Biblioteca necessária para alguns aplicativos que usam a camada de gerenciamento de janelas X (Xmu)
    bash-completion \  # Complemento de autocompletar para o Bash
    htop \  # Monitor de recursos interativo
    rsync \  # Ferramenta de sincronização e transferência de arquivos
    wget \  # Utilitário para baixar arquivos da web
    htop \  # Monitor de recursos interativo
    build-essential \  # Conjunto de pacotes essenciais para compilar software no sistema
    linux-headers-amd64 \  # Cabeçalhos do kernel Linux para arquitetura amd64
    vim \  # Editor de texto avançado
    sudo \  # Permite que usuários não privilegiados executem comandos como superusuários
    ca-certificates \  # Certificados de autoridade confiáveis
    curl \  # Ferramenta para transferência de dados com sintaxe de URL
    apt-transport-https \  # Suporte ao transporte HTTPS para APT
    gnupg2 \  # Implementação do GnuPG para criptografia e assinatura
    sudo \  # Permite que usuários não privilegiados executem comandos como superusuários
    apt-file \  # Ferramenta para pesquisar arquivos em pacotes disponíveis nos repositórios
    arping \  # Ferramenta de ping avançada que envia pacotes ARP para descobrir e mapear hosts em uma rede local
    hping3 \  # Ferramenta avançada de verificação e teste de rede
    mtr-tiny \  # Ferramenta de diagnóstico de rede que combina as funcionalidades do traceroute e do ping
    awscli \  # Interface de linha de comando da AWS (Amazon Web Services)
    ntpdate \  # Atualiza o relógio do sistema a partir de servidores NTP
    bind9-dnsutils  # Pacote contendo utilitários DNS do BIND9

apt-file update
exit 0
