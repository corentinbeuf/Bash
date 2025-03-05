# GestSup
Your content here

## Présentation

## Installation
- Mettre à jour les sources puis mettre à jour les paquets.
```bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
```
- Installer les paquets prérequis.
```bash
sudo apt-get install apache2 mariadb-server unzip curl ntp cron -y
```
- Installer **PHP**.
```bash
sudo apt-get install php libapache2-mod-php -y
```
- Installer les modules de **PHP**.
```bash
sudo apt-get install php-{common,curl,gd,imap,intl,ldap,mbstring,mysql,xml,zip} -y
```
- Se connecter à **MariaDB**.
```bash
mariadb -u root
```
- Créer l'utilisateur "**gestsup**".
```mysql
CREATE USER 'gestsup'@'localhost' IDENTIFIED BY 'password';
```
- Donner les droits à l'utilisateur.
```mysql
GRANT ALL PRIVILEGES ON *.* TO 'gestsup'@'localhost';
```
- Recharger les privilèges.
```mysql
FLUSH PRIVILEGES;
```
- Sortir de MariaDB.
```mysql
exit
```
- Sécuriser MariaDB.
```bash
mysql_secure_installation
```
- Répondre comme suit au différentes questions :
	- Change the root password ? : `y` 
	- Remove anonymous users ? : `y` 
	- Disallow root login remotely ? : `y` 
	- Remove test database and access to it ? : `y` 
	- Reload privilege tables now ? `y`
- Editer le fichier de configuration de **PHP**.
```bash
sudo nano /etc/php/8.2/apache2/php.ini
```
- Faire correspondre les champs suivants avec les valeurs suivantes :
	- `max_execution_time = 480`
	- `memory_limit = 512M`
	- `upload_max_filesize = 8M`
	- `date.timezone = Europe/Paris`
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pous sauvegarder puis quitter le fichier.
- Editer le fichier de configuration de **MariaDB**.
```bash
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```
- Faire correspondre les champs suivants avec les valeurs suivantes :
	- `innodb_buffer_pool_size = 1G`
	- `skip-name-resolve`
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pous sauvegarder puis quitter le fichier.
- Télécharger la dernière version de **GestSup**.
```bash
wget -P /var/www/html https://gestsup.fr/downloads/versions/current/version/gestsup_3.2.52.zip
```
- Dézipper le fichier.
```bash
sudo unzip /var/www/html/gestsup_3.2.52.zip -d /var/www/html
```
- Supprimer le fichier **ZIP** ainsi que le fichier **index.html**.
```bash
sudo rm /var/www/html/gestsup_3.2.52.zip
sudo rm /var/www/html/index.html
```
- Créer l'utilisateur "**gestsup**.
```bash
sudo adduser gestsup --ingroup www-data
```
- Donner les droits à l'utilisateur précédemment créé sur le dossier "**/var/www/html**".
```bash
sudo chown -R gestsup:www-data /var/www/html/
```
- Définir les bons droits pour les dossiers et les fichiers liées à **GestSup**.
```bash
sudo find /var/www/html/ -type d -exec chmod 750 {} \\;
sudo find /var/www/html/ -type f -exec chmod 640 {} \\;
sudo chmod 770 -R /var/www/html/upload
sudo chmod 770 -R /var/www/html/images/model
sudo chmod 770 -R /var/www/html/backup
sudo chmod 770 -R /var/www/html/_SQL
sudo chmod 660 /var/www/html/connect.php
```
- Redémarrer le serveur.
```bash
sudo reboot
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP`
- Une fois l'installation terminée sur le navigateur, supprimer le dossier "**install**".
```bash
sudo rm -rf /var/www/html/install/
```
- Définir les bons droits sur le fichier "**connect.php**".
```bash
sudo chmod 640 /var/www/html/connect.php
```

## Configuration

## Sauvegarde

## Restauration

## Mise à jour