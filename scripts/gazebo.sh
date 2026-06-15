#!/bin/bash

#=======================================================================================#
# Objectif : Script shell pour l'installation de Gazebo
# Nom : Quentin Capaccioli
# Date : 15/06/2026
# Derniere modification: Support Ubuntu/Debian
#=======================================================================================#
source ../lib/utils.sh

#================================#
#   Fonction de telechargement   #
#================================#
Gazebo_Download() {
    section "Installation de Gazebo"

    Detect_Distro || { Check_Gazebo=0; return 1; }

    # Installation d outils necessaires
    sudo apt-get install -y curl lsb-release gnupg

    # Installation de Gazebo Harmonic compatible Ubuntu Noble et ROS2 Jazzy
    sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] https://packages.osrfoundation.org/gazebo/${DISTRO_ID}-stable ${DISTRO_CODENAME} main" \
    | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y gz-harmonic

    # Test de fonctionnement de l outil
    if gz sim --version; then
        Check_Gazebo=1
    else
        Check_Gazebo=0
    fi
}
