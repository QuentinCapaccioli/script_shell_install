# Script d'installation des outils de développement

## Description
Script shell permettant d'installer automatiquement les outils de développement de base sur Ubuntu Noble (24.04).

## Outils installés
| Outil   | Version      | Description                        |
|---------|--------------|------------------------------------|
| Git     | Dernière     | Gestionnaire de versions           |
| Docker  | Dernière     | Plateforme de conteneurisation     |
| VsCode  | Dernière     | Éditeur de code                    |
| ROS2    | Jazzy        | Framework robotique                |
| Gazebo  | Harmonic     | Simulateur robotique               |
| RViz2   | Jazzy        | Outil de visualisation ROS2        |

## Dernière version testée
- Git → 2.43.0
- Docker → 29.5.3
- VsCode → 1.123.0

## Prérequis
- Ubuntu Noble (24.04)
- Connexion internet
- Droits sudo

## Installation
```bash
git clone https://github.com/QuentinCapaccioli/Script_Installation.git
cd mon-repo
chmod +x install.sh
./install.sh
```

## Arborescence
```
script_shell_install/
├── README.md
├── install.sh              # Point d'entrée principal
├── scripts/
│   ├── docker.sh           # Installation Docker
│   ├── gazebo.sh           # Installation Gazebo
│   ├── git.sh              # Installation Git
│   ├── ros2.sh             # Installation ROS2 & RViz2
│   └── vscode.sh           # Installation VsCode
└── lib/
    └── utils.sh            # Fonctions utilitaires (log, error, section)
```

## Auteur
Quentin Capaccioli — 2026
