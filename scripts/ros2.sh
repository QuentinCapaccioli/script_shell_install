#!/bin/bash

#=======================================================================================#
# Objectif : Script shell pour l'installation de ROS2 et de Rviz2
# Nom : Quentin Capaccioli
# Date : 04/06/2026
# Derniere modification: Creation du script
#=======================================================================================#

#================================#
#   Fonction de telechargement   #
#================================#
ROS2_Download() {
    section "Installation de ROS2"

    # Installation des UTF-8 locales
    sudo apt update
    sudo apt install -y locales

    # Installation de Ubuntu Universe repository
    sudo apt install -y software-properties-common
    sudo add-apt-repository -y universe

    # Installation de la cle GPG de ROS2
    sudo apt update
    sudo apt install curl -y
    export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F'"' '{print $4}')
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
    sudo dpkg -i /tmp/ros2-apt-source.deb
    
    # Verification des sources Ubuntu Noble
    if ! grep -q "noble-updates" /etc/apt/sources.list.d/ubuntu.sources; then
        sudo sed -i 's/Suites: noble/Suites: noble noble-updates noble-backports/' \
            /etc/apt/sources.list.d/ubuntu.sources
        sudo apt clean
        sudo apt update
        sudo apt full-upgrade -y
    fi

    sudo apt update
    sudo apt install -y ros-dev-tools

    # Installation des packages ROS2
    sudo apt update
    sudo apt -y upgrade
    sudo apt install -y ros-jazzy-desktop
    sudo apt install -y ros-jazzy-ros-base

    # Test de fonctionnement de l outil ROS2
    source /opt/ros/jazzy/setup.bash
    if ros2 topic list 2>/dev/null; then
        Check_ROS2=1
    else
        Check_ROS2=0
    fi

    # Test de fonctionnement de l outil Rviz2
    if command -v rviz2 &> /dev/null; then
        Check_Rviz=1
    else
        Check_Rviz=0
    fi
}
