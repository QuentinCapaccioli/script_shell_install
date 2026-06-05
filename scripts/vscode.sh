#!/bin/bash

#=======================================================================================#
# Objectif : Script shell pour l'installation de VsCode
# Nom : Quentin Capaccioli
# Date : 04/06/2026
# Derniere modification: Creation du script
#=======================================================================================#

#================================#
#   Fonction de telechargement   #
#================================#
VsCode_Download() {
    section "Installation de VsCode"

    sudo apt install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor --yes -o /usr/share/keyrings/microsoft.gpg

    sudo tee /etc/apt/sources.list.d/vscode.sources <<EOF
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
    sudo apt update
    sudo apt install -y code

    # Test de fonctionnement de l outil
    if code --version; then
        Check_VsCode=1
    else
        Check_VsCode=0
    fi
}
