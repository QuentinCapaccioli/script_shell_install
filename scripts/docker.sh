#!/bin/bash

#=======================================================================================#
# Objectif : Script shell pour l'installation de Docker
# Nom : Quentin Capaccioli
# Date : 15/06/2026
# Derniere modification: Support Ubuntu/Debian
#=======================================================================================#
source ../lib/utils.sh

#================================#
#   Fonction de telechargement   #
#================================#
Docker_Download() {
    section "Installation de Docker"
    
    Detect_Distro || { Check_Docker=0; return 1; }

    # Suppression des packages pouvant creer des conflits
    sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc | cut -f1)

    # Ajout de la clé GPG officiel de Docker
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL "https://download.docker.com/linux/${DISTRO_ID}/gpg" -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Ajout du repositery aux sources APT
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/${DISTRO_ID}
Suites: ${DISTRO_CODENAME}
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
    sudo apt update # IMPORTANT car ajout depot externe avant
    
    # Installation de la derniere version
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Test de fonctionnement de l outil
    if sudo systemctl status docker --no-pager && sudo docker run hello-world; then
        Check_Docker=1
    else
        Check_Docker=0
    fi
}