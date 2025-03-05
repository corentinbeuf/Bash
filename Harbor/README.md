# Harbor
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
- Télécharger la dernière version d'**Harbor**.
```bash
cd /tmp
curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '\.tgz$' | wget -i -
```
- Dézipper le fichier téléchargé.
```bash
sudo tar xvzf harbor-offline-installer*.tgz
```
- Copier le fichier modèle pour créer votre propre configuration.
```bash
sudo cp harbor/harbor.yml.tmpl harbor/harbor.yml
```
- Editer le fichier "**harbor.yml**".
```bash
sudo nano /tmp/harbor/harbor.yml
```
- Modifier la ligne `hostname: reg.mydomain.com`en `hostname: IPouFQDN`.
- Commenter la ligne `port: 443`.
- Commenter la ligne `https:`.
- Commenter la ligne `certificate: /your/certificate/path`
- Commenter la ligne `private_key: /your/private/key/path/`
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Préparer l'installation d'**Harbor**.
```bash
sudo ./harbor/prepare
```
- Installer Harbor.
```bash
sudo ./harbor/install.sh
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP`

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Harbor/install_harbor.sh)
{.links-list}

## Configuration

## Sauvegarde

## Restauration

## Mise à jour