# Ansible Sémaphore
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install git curl wget software-properties-common ansible postgresql nginx sudo -y
```
- Se connecter à **PostgreSQL** avec l'utilisateur "**postgres**".
```bash
sudo -u postgres psql
```
- Créer l'utilisateur "**semaphore**".
```psql
CREATE USER semaphore WITH PASSWORD 'passw0rd';
```
- Créer la base de données "**sempahoredb**".
```psql
CREATE DATABASE semaphoredb OWNER semaphore;
```
- Quitter PostgreSQL.
```psql
\q
```
- Télécharger la dernière version d'**Ansible Sémaphore**.
```bash
VER=$(curl -s https://api.github.com/repos/semaphoreui/semaphore/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/v//g')
wget -q https://github.com/semaphoreui/semaphore/releases/download/v${VER}/semaphore_${VER}_linux_amd64.deb
```
- Installer le paquet téléchargé.
```bash
sudo dpkg -i semaphore_${VER}_linux_amd64.deb
```
- Vérifier la localisation d'**Ansible Sémaphore**.
```bash
sudo which semaphore
```
- Créer le dossier "**/etc/semaphore**".
```bash
sudo mkdir -p /etc/semaphore
```
- Se rendre dans le dossier créé précédemment.
```bash
cd /etc/semaphore
```
- Lancer le script d'installation.
```bash
sudo semaphore setup
```
- Répondre comme suit au différentes questions :
	- Sélectionner l'opetion `3`
	- db Hostname (default 127.0.0.1:5432): ``
	- db User (default root): `semaphore`
	- db Password: `passw0rd`
	- db Name (default semaphore): `semaphoredb`
	- Playbook path (default /tmp/semaphore): `/opt/semaphore`
	- Public URL (optional, example: https://example.com/semaphore): ``
	- Enable email alerts? (yes/no) (default no): ``
	- Enable telegram alerts? (yes/no) (default no): ``
	- Enable slack alerts? (yes/no) (default no): ``
	- Enable Rocket.Chat alerts? (yes/no) (default no): ``
	- Enable Microsoft Team Channel alerts? (yes/no) (default no): ``
	- Enable LDAP authentication? (yes/no) (default no): ``
	- Config output directory (default /etc/semaphore): ``
	- Username: `admin`
	- Email: `admin@example.com`
	- Your name: `admin me`
	- Password: `passw0rd`
- Créer le fichier "**semephore.service**"
```bash
sudo nano /etc/systemd/system/semaphore.service
```
- Ajouter les lignes suivantes dans le fichier :
```service
[Unit]
Description=Semaphore Ansible
Documentation=https://github.com/ansible-semaphore/semaphore
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/bin/semaphore service --config=/etc/semaphore/config.json
SyslogIdentifier=semaphore
Restart=always

[Install]
WantedBy=multi-user.target
```
- Redémarrer le daemon.
```bash
sudo systemctl daemon-reload
```
- Activer le démarrage automatique d'**Ansible Sémaphore**.
```bash
sudo systemctl enable semaphore
```
- Créer le fichier "**semaphore.conf**" dans la configuration de **Nginx**.
```bash
sudo nano /etc/nginx/sites-available/semaphore.conf
```
- Ajouter les lignes suivantes dans le fichier.
```conf
upstream semaphore {
    server 127.0.0.1:3000;
  }

server {
    listen 80;
    server_name auto.howtoforge.local;
      client_max_body_size 0;
      chunked_transfer_encoding on;

    location / {
      proxy_pass http://semaphore/;
      proxy_set_header Host $http_host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      
      proxy_set_header X-Forwarded-Proto $scheme;

      proxy_buffering off;
      proxy_request_buffering off;
    }

    location /api/ws {
      proxy_pass http://semaphore/api/ws;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header Origin "";
    }
}
```
- Créer un lien symbolique pour le fichier de configuration de Nginx créé précédemment.
```bash
sudo ln -s /etc/nginx/sites-available/semaphore.conf /etc/nginx/sites-enabled/
```
- Vérifier la configuration de **Nginx** ainsi que les autres fichiers de configuration.
```bash
sudo nginx -t
```
- Redémarrer le service **Nginx**.
```bash
sudo systemctl restart nginx
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:3000`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour