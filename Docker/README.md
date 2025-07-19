# Docker
## Présentation
Docker est un outil qui aide les développeurs à créer, partager et exécuter des applications en utilisant des conteneurs.

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install ca-certificates curl
```
- Créer le dossier "**/etc/apt/keyrings**".
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
- Télécharger la clé GPG de Docker.
```bash
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
```
- Donner les droits de lecture sur la clé.
```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
- Ajouter Docker dans les sources de la machine virtuelle.
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer Docker et Docker-Compose.
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Docker/install_docker.sh)
{.links-list}

## Configuration
- Ajouter vos utilisateurs dans le groupe "**docker**" pour exécuter les commandes plus facilement.
```bash
sudo usermod -aG docker $USER
```
- Créer un dossier par conteneur dans le dossier "**/docker**" pour centraliser vos données dans un même dossier racine.
```bash
sudo mkdir -p /docker/nom_conteneur
```

## Sauvegarde
- Sauvegarder le dossier "**/docker**" où toutes les données sont présentes.
```bash
rsync -aqz /docker/ user@192.168.1.1:/docker/container
```
- Si vous avez des conteneurs qui ne sont pas mappé avec un dossier, sauvegarder également le dossier "**/var/lib/docker/volumes**".
```bash
rsync -aqz /var/lib/docker/volumes/ user@192.168.1.1:/docker/data_volumes
```
- Sauvegarder également le dossier "**/etc/docker**", si vous avez modifier la configuration par défaut de Docker.
```bash
rsync -aqz /etc/docker/ user@192.168.1.1:/docker/config
```

## Restauration
- Arrêter tous les conteneurs en cours d'exécution sur votre serveur.
```bash
sudo docker stop ...
```
- Copier les données depuis votre serveur de sauvegarde sur votre serveur Docker.
```bash
sudo scp -rp user@192.168.1.1:/docker/container/ /docker
```
- Redémarrer vos conteneurs.
```bash
sudo docker restart ...
```

## Mise à jour
- Mettre à jour les sources du serveur.
```bash
sudo apt-get update
```
- Installer les paquets à mettre à jour.
```bash
sudo apt-get upgrade -y
```
