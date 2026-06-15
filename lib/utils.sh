#!/bin/bash

#=======================================================================================#
# Objectif : Fonctions afin de rendre la console plus lisible
# Nom : Quentin Capaccioli
# Date : 15/06/2026
# Derniere modification: Support Ubuntu/Debian
#=======================================================================================#

#==============================#
#   Fonctions utilitaires      #
#==============================#
log() {
    echo -e "\e[32m[INFO]\e[0m $1";
}

error() {
    echo -e "\e[31m[ERROR]\e[0m $1";
}

section() {
    echo -e "\n\e[34m=== $1 ===\e[0m";
}

#==============================================#
#   Fonction de detection de la distribution   #
#==============================================#
Detect_Distro() {
    if [ ! -f /etc/os-release ]; then
        error "Impossible de détecter la distribution"
        exit 1
    fi
    
    . /etc/os-release
    
    DISTRO_ID="$ID"
    DISTRO_CODENAME="$VERSION_CODENAME"

    if [[ "$DISTRO_ID" != "ubuntu" && "$DISTRO_ID" != "debian" ]]; then
        error "Distribution non supportée : $DISTRO_ID"
        return 1
    fi
    return 0
}