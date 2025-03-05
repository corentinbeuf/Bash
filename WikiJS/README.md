# WikiJS
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
```
- Ajouter **NodeJS** aux sources de la machine virtuelle.
```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```
- Mettre à jour les sources et installer **NodeJS**.
```bash
sudo apt-get update && sudo apt-get install nodejs -y
```
- Installer **PostgreSQL**.
```bash
sudo apt-get install postgresql -y
```
- Editer le fichier "**pg_hba.conf**".
```bash
sudo nano /etc/postgresql/15/main/pg_hba.conf
```
- Modifier la ligne `local all all peer`en `local all all trust`.
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Redémarrer le service **PostgreSQL**.
```bash
sudo systemctl restart postgresql
```
- Se connecter sur la session "**postgres**".
```bash
sudo -i -u postgres
```
- Créer l'utilisateur "**wikijs**".
```bash
createuser -P --interactive wikijs
```
- Créer la base de données "**wikijs**".
```bash
createdb wikijs
```
- Valide rla connexion à la base de données avec la commande "**psql**".
```bash
psql -U wikijs ou psql -h 127.0.0.1 -U wikijs -d wikijs
```
- Quitter PostgreSQL.
```psql
\q
```
- Sortir de la session de l'utilisateur "postgres".
```bash
exit
```
- Se rendre dans le dossier "**/tmp**".
```bash
cd /tmp
```
- Télécharger la dernière version de **WikiJS**.
```bash
wget https://github.com/requarks/wiki/releases/download/v2.5.305/wiki-js.tar.gz
```
- Créer le dossier "**wikijs**".
```bash
sudo mkdir /etc/wikijs
```
- Dézipper le fichier téléchargé dans le dossier créé précédemment.
```bash
sudo tar xzf wiki-js.tar.gz -C /etc/wikijs
```
- Se rendre dans le dossier "**wikijs**".
```bash
cd /etc/wikijs
```
- Copier le fichier "**sample.config.yml**".
```bash
sudo mv config.sample.yml config.yml
```
- Editer le fichier "**config.yml**".
```bash
sudo nano config.yml
```
- Faire correspondre les lignes suivantes dans le fichier :
```yml
db:
  type: postgres
  host: localhost
  port: 5432
  user: wikijs
  pass: f4v2spdi
  db: wikijs
  ssl: false
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pous sauvegarder puis quitter le fichier.
- Lancer le server **NodeJS** pour valider la configuration.
```bash
sudo node server
```
- Créer un fichier nommé "**wikijs.service**".
```bash
sudo nano /etc/systemd/system/wiki.service
```
- Ajouter les lignes suivantes dans le fichier :
```service
[Unit]
Description=Wiki.js
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/node server
Restart=always
# Consider creating a dedicated user for Wiki.js here:
User=nobody
Environment=NODE_ENV=production
WorkingDirectory=/etc/wikijs

[Install]
WantedBy=multi-user.target
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pous sauvegarder puis quitter le fichier.
- Redémarrer le daemon.
```bash
sudo systemctl daemon-reload
```
- Activer le démarrage automatique de **WikiJS**.
```bash
sudo systemctl enable wiki
```
- Démarrer le service "**wiki**".
```bash
sudo systemctl start wiki
```
- Définir les bons droits sur le dossier "**wikijs**".
```bash
sudo chown -R nobody /etc/wikijs/
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:3000`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour