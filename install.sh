#!/bin/bash

#=======================================================================================#
# Objectif : Script shell permettant d'installer les outils de developpement de base
# La liste actuelle est :
# - Docker
# - Gazebo
# - Git
# - ROS2
# - RViz
# - VsCode
# Nom : Quentin Capaccioli
# Date : 04/06/2026
# Derniere modification: Creation du script
#=======================================================================================#

source lib/utils.sh
for script in scripts/*.sh; do
    source "$script"
done

#===================================#
#   Initialisation des variables    #
#===================================#
Check_Docker=0
Check_Gazebo=0
Check_Git=0
Check_ROS2=0
Check_Rviz=0
Check_VsCode=0

#========================================#
#   Fonctions de verification globale    #
#========================================#
verify_install() {
    local outil=$1
    local status=$2

    if [ "$status" -eq 1 ]; then
        log "$outil a été installé avec succès ✓"
    else
        error "Problème lors de l'installation de $outil ✗"
    fi
}

Verification_Downloads() {
    section "Résumé de l'installation"
    verify_install "Docker" $Check_Docker
    verify_install "Gazebo" $Check_Gazebo
    verify_install "Git" $Check_Git
    verify_install "ROS2" $Check_ROS2
    verify_install "Rviz" $Check_Rviz
    verify_install "VsCode" $Check_VsCode
}
 
#===================#
#   Main du script  #
#===================#
sudo apt update
sudo apt upgrade -y

# Telechargement des outils
Docker_Download 
Gazebo_Download
Git_Download
ROS2_Download   # telechargement de Rviz2 en plus
VsCode_Download

# Verification
Verification_Downloads