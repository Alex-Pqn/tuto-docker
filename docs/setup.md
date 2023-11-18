# Mise en place Docker

## Introduction
Docker est un outil de conteneurisation qui permet aux développeurs de créer, déployer et exécuter des applications dans des environnements isolés appelés conteneurs. Il offre une grande portabilité et assure la consistance entre les environnements de développement et de production, simplifiant ainsi le processus de développement dans un projet informatique.

## Prérequis
- Installer [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Installer une distribution Linux (par exemple Ubuntu depuis le Microsoft Store, installation en ligne de commande également possible)
- Activer la fonctionnalité Windows "Plateforme de machine virtuelle" puis redémarer le PC (Pannneau de configuration -> Programmes -> Activer ou désactiver des fonctionnalités Windows)

## Installation

### Premier lancement et configuration de la distribution Linux
![](img/Screenshot_1.png)
L'environnement de la distribution Linux est également accessible depuis l'explorateur de fichiers Windows.
![](img/Screenshot_2.png)
Créer un dossier de travail "home/username/www" pour les futurs projets.
![](img/Screenshot_3.png)

### Mettre à jour l'environnement 
```bash
sudo apt update
```

### Installer VS Code
[Suivre la documentation.](https://code.visualstudio.com/docs/setup/linux)\
VS Code est désormais disponnible avec la commande "code path/to/project".\
Connexion au compte GitHub depuis VS Code pour synchroniser les settings.
