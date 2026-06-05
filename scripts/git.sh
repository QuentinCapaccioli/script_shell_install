#!/bin/bash

#=======================================================================================#
# Objectif : Script shell pour l'installation de Git
# Nom : Quentin Capaccioli
# Date : 04/06/2026
# Derniere modification: Creation du script
#=======================================================================================#

#================================#
#   Fonction de telechargement   #
#================================#
Git_Download() {
    section "Installation de Git"
    sudo apt install -y git-all

    # Test de fonctionnement de l outil
    if git --version; then
        Check_Git=1
    else
        Check_Git=0
    fi
}
