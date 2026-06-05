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

## Prérequis
- Ubuntu Noble (24.04)
- Connexion internet
- Droits sudo

## Installation
```bash
git clone <url_du_repo>
cd mon-repo
chmod +x install.sh
./install.sh
```

## Arborescence
```
mon-repo/
├── README.md
├── install.sh              # Point d'entrée principal
├── scripts/
│   ├── docker.sh           # Installation Docker
│   ├── gazebo.sh           # Installation Gazebo
│   ├── git.sh              # Installation Git
│   ├── ros2.sh             # Installation ROS2
│   ├── rviz.sh             # Installation RViz2
│   └── vscode.sh           # Installation VsCode
├── lib/
│   └── utils.sh            # Fonctions utilitaires (log, error, section)
├── src/
│   └── mon_package_ros2/   # Package ROS2
└── logs/
    └── .gitkeep
```

## Auteur
Quentin Capaccioli — 2026
