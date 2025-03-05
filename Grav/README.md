# Grav
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install unzip php php-fpm php-gd php-curl php-zip php-mbstring php-xml -y
```
- Télécharger la dernière version de **Grav**.
```bash
wget https://getgrav.org/download/core/grav-admin/latest -O grav.zip
```
- Dézipper le fichier téléchargé.
```bash
sudo unzip grav.zip
```
- Déplacer les fichiers extraits dans le dossier "**/var/www/html/grav**".
```bash
sudo mv grav-admin /var/www/html/grav
```
- Appliquer les bons droits sur les fichiers déplacés.
```bash
sudo chown -R www-data: /var/www/html/grav/
```
- Activer les modules "**proxy**", "**proxy_fcgi**" et "**rewrite**".
```bash
sudo a2enmod proxy proxy_fcgi rewrite
```
- Activer la configuration "**PHP8.2-fpm**".
```bash
sudo a2enconf php8.2-fpm
```
- Redémarrer le service Apache2.
```bash
sudo systemctl restart apache2
```
- Editer le fichier "**apche2.conf**".
```bash
sudo nano /etc/apache2/apache2.conf
```
- Rajouter les lignes suivantes à la fin du fichier :
```conf
<Directory /var/www/> 
	Options Indexes FollowSymLinks
	AllowOverride All
	Require all granted
</Directory>
```
- Redémarrer le service Apache2.
```bash
sudo systemctl restart apache2
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP/grav`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour