#!/bin/bash

#=======================================================================================#
# Objectif : Fonctions afin de rendre la console plus lisible
# Nom : Quentin Capaccioli
# Date : 04/06/2026
# Derniere modification: Creation du script
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