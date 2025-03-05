# Apache Guacamole
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install build-essential libcairo2-dev libjpeg62-turbo-dev libpng-dev libtool-bin uuid-dev libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev -y
```
- Se rendre dans le dossier "**/tmp**".
```bash
cd /tmp
```
- Télécharger la dernière version de Guacamole server.
```bash
wget https://downloads.apache.org/guacamole/1.5.5/source/guacamole-server-1.5.5.tar.gz
```
- Dézipper le fichier téléchargé.
```psql
tar -xzf guacamole-server-1.5.5.tar.gz
```
- Se rendre dans le dossier créé lors de l'extraction.
```bash
cd guacamole-server-1.5.5/
```
- Vérifier que tous les prérequis sont installés sur la machine virtuelle.
```bash
sudo ./configure --with-systemd-dir=/etc/systemd/system/
```
- Compiler le code.
```bash
sudo make
```
- Installer **Apache Guacamole Server**.
```bash
sudo make install
```
- Mettre à jour les liens entre **Apache Guacamole Server** et les librairies
```bash
sudo ldconfig
```
- Redémarrer le daemon.
```bash
sudo systemctl daemon-reload
```
- Activer le démarrage automatique d'**Apache Guacamole Server**.
```bash
sudo systemctl enable guacd
```
- Créer les répertoire de configuration.
```bash
sudo mkdir -p /etc/guacamole/{extensions,lib}
```
- Créer un fichier pour ajouter les sources de **Tomcat**.
```bash
sudo nano /etc/apt/sources.list.d/bullseye.list 
```
- Ajouter la lignes suivantes dans le fichier :
```
deb http://deb.debian.org/debian/ bullseye main
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer **Tomcat 9**" :
```bash
sudo apt-get install tomcat9 tomcat9-admin tomcat9-common tomcat9-user -y
```
- Se rendre dans le dossier "**/tmp**".
```bash
cd /tmp
```
- Télécharger la dernière version de Guacamole.
```bash
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war
```
- Déplacer le fichier téléchargé dans le dossier de **Tomcat**.
```psql
sudo mv guacamole-1.5.5.war /var/lib/tomcat9/webapps/guacamole.war
```
- Redémarrer les services de **Tomcat** et d'**Apache Guacamole**.
```bash
sudo systemctl restart tomcat9 guacd
```
- Installer **MariaDB**.
```bash
sudo apt-get install mariadb-server -y
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
- Se connecter à **MariaDB**.
```bash
mysql -u root -p
```
- Créer la base de données "**guacdb**.
```mysql
CREATE DATABASE guacadb;
```
- Créer l'utilisateur "**guacamole**".
```mysql
CREATE USER 'guacamole'@'localhost' IDENTIFIED BY 'P@ssword!';
```
- Donner les droits sur la base de données à l'utilisateur précédemment créé.
```mysql
GRANT SELECT,INSERT,UPDATE,DELETE ON guacadb.* TO 'guacamole'@'localhost';
```
- Recharger les droits.
```mysql
FLUSH PRIVILEGES;
```
- Quitter **MySQL**.
```mysql
EXIT;
```
- Se rendre dans le dossier "**/tmp**".
```bash
cd /tmp
```
- Télécharger l'extension **MySQL** d'**Apache Guacamole**.
```bash
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-auth-jdbc-1.5.5.tar.gz
```
- Décompresser le fichier téléchargé.
```bash
tar -xzf guacamole-auth-jdbc-1.5.5.tar.gz
```
- Déplacer le fichier "**.jar**" dans le dossier "**/etc/guacamole/extensions**".
```bash
sudo mv guacamole-auth-jdbc-1.5.5/mysql/guacamole-auth-jdbc-mysql-1.5.5.jar /etc/guacamole/extensions/
```
- Se rendre dans le dossier "**/tmp**".
```bash
cd /tmp
```
- Télécharger le connecteur **MySQL**.
```bash
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-9.1.0.tar.gz
```
- Décompresser le fichier téléchargé.
```bash
tar -xzf mysql-connector-j-9.1.0.tar.gz
```
- Copier le connecteur dans le dossier "**/etc/guacamole/lib**".
```bash
sudo cp mysql-connector-j-9.1.0/mysql-connector-j-9.1.0.jar /etc/guacamole/lib/
```
- Se rendre dans le dossier comprenant le schéma de la base de données.
```bash
cd guacamole-auth-jdbc-1.5.5/mysql/schema/
```
- Importer les schéma dans MariaDB.
```bash
cat *.sql | mysql -u root -p guacadb
```
- Editer le fichier de configuration d'**Apache Guacamole**.
```bash
sudo nano /etc/guacamole/guacamole.properties
```
- Ajouter la configuration suivante dans le fichier.
```
# MySQL
mysql-hostname: 127.0.0.1
mysql-port: 3306
mysql-database: guacadb
mysql-username: guacamole
mysql-password: P@ssword!
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Editer le fichier de configuration du service "**guacd**".
```bash
sudo nano /etc/guacamole/guacd.conf
```
- Ajouter la configuration suivante dans le fichier.
```
[server] 
bind_host = 0.0.0.0
bind_port = 4822
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Redémarrer les services "**tomcat9**", "**guacd**" et "**mariadb**".
```bash
sudo systemctl restart tomcat9 guacd mariadb
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:8080/guacamole`

## Configuration
### Création d'un compte d'administration

### Ajouter une connexion
#### SSH

#### RDP

### Plugin TOTP
- Se rendre dans le dossier "**/tmp**".
```bash
cd /tmp
```
- Télécharger le module TOTP d'**Apache Guacamole**.
```bash
wget https://downloads.apache.org/guacamole/1.5.5/binary/guacamole-auth-totp-1.5.5.tar.gz
```
- Décompresser le fichier téléchargé.
```bash
tar -xzf guacamole-auth-totp-1.5.5.tar.gz
```
- Déplacer le fichier "**.jar**" dans le dossier "**/etc/guacamole/extensions**".
```bash
sudo mv guacamole-auth-totp-1.5.5/guacamole-auth-totp-1.5.5.jar /etc/guacamole/extensions/
```
- Editer le fichier de configuration d'**Apache Guacamole**.
```bash
sudo nano /etc/guacamole/guacamole.properties
```
- Ajouter la configuration suivante à la fin du fichier.
```
# TOTP
totp-issuer: Guacamole CBF
totp-digits: 6
totp-period: 30
totp-mode: sha1
```
- Redémarrer le service "**tomcat9**".
```bash
sudo systemctl restart tomcat9
```

### Plugin OpenID

## Sauvegarde

## Restauration

## Mise à jour