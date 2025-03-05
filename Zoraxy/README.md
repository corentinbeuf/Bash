# Zoraxy
Your content here

## Présentation

## Installation
- Mettre à jour les source.
```bash
sudo apt-get update
```
- Télécharger la dernière version de **Golang**.
```bash
wget https://go.dev/dl/go1.23.5.linux-amd64.tar.gz
```
- Dézipper la version téléchargée.
```bash
sudo tar -C /usr/local/ -xzf go1.23.5.linux-amd64.tar.gz
```
- Editer le fichier "**.profile**" de l'utilisateur.
```bash
nano $HOME/.profile
```
- Ajouter la ligne suivante à la fin du fichier :
```bash
export PATH=$PATH:/usr/local/go/bin
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Exécuter le fichier modifier.
```bash
source .profile
```
- Valider que **Golang** est bien installé sur le serveur.
```bash
go version
```
- Installer **Git**.
```bash
sudo apt-get install git -y
```
- Cloner le projet **Zoraxy**.
```bash
git clone https://github.com/tobychui/zoraxy
```
- Se rendre dans le dossier "**src**".
```bash
cd ./zoraxy/src/
```
- Télécharger les dépendances nécessaire.
```bash
go mod tidy
```
- Builder le projet.
```bash
go build
```
- Déplacer le dossier "**zoraxy**" à la racine du serveur.
```bash
sudo mv zoraxy/ /
```
- Créer un fichier nommé "**start.sh**".
```bash
nano /zoraxy/start.sh
```
- Ajouter les lignes suivantes dans le fichier.
```shell
#!/bin/bash
./src/zoraxy -port=:8000
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Appliquer les droits d'exécution sur le fichier.
```bash
sudo chmod +x start.sh
```
- Créer un fichier de service pour l'application.
```bash
sudo nano /etc/systemd/system/zoraxy.service
```
- Ajouter la configuration suivante :
```service
[Unit]
Description=Zoraxy Reverse Proxy Server
#Waits for network to be online
After=network-online.target
Wants=network-online.target

[Service]
Type=simple

#No sudo required in start.sh
User=root   
Group=root

#Folder where zoraxy is located
WorkingDirectory=/zoraxy    
#absolute path for start.sh
ExecStart=/bin/bash /zoraxy/start.sh     

[Install]
WantedBy=multi-user.target
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Activer le démarrage automatique du service "**zoraxy**".
```bash
sudo systemctl enable --now zoraxy
```
- Démarre le service "**zoraxy**".
```bash
sudo systemctl start zoraxy
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:8000`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour