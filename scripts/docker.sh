#!/bin/bash

#=======================================================================================#
# Objectif : Script shell pour l'installation de Docker
# Nom : Quentin Capaccioli
# Date : 04/06/2026
# Derniere modification: Creation du script
#=======================================================================================#

#================================#
#   Fonction de telechargement   #
#================================#
Docker_Download() {
    section "Installation de Docker"
    # Suppression des packages pouvant creer des conflits
    sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc | cut -f1)

    # Ajout de la clé GPG officiel de Docker
    sudo apt update
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Ajout du repositery aux sources APT
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

    sudo apt update

    # Installation de la derniere version
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Test de fonctionnement de l outil
    if sudo systemctl status docker --no-pager && sudo docker run hello-world; then
        Check_Docker=1
    else
        Check_Docker=0
    fi
}