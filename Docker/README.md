# Docker
Your content here

## Présentation

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

## Sauvegarde

## Restauration

## Mise à jour