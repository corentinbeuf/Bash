# ProjectSend
Your content here

## Présentation

## Installation
- Mettre à jour les source.
```bash
sudo apt-get update
```
- Installer **Apache** et les dépendances **PHP**.
```bash
sudo apt-get install apache2 mariadb-server php libapache2-mod-php php-mysql php-gd php-mbstring php-xml php-zip unzip -y
```
- Télécharger la dernière version de **ProjectSend**.
```bash
wget https://github.com/projectsend/projectsend/releases/download/r1720/projectsend-r1720.zip
```
- Dézipper la version téléchargée.
```bash
sudo unzip projectsend-r1720.zip -d /var/www/html/projectsend/
```
- Se connecter à **MySQL**.
```bash
mysql -u root -p
```
- Créer la base de données **projectsend**.
```sql
CREATE DATABASE projectsend;
```
- Créer l'utilisateur "**projectsenduser**".
```sql
CREATE USER 'projectsenduser'@'localhost' IDENTIFIED BY 'password';
```
- Donner les droits à l'utilisateur sur la base de données.
```sql
GRANT ALL PRIVILEGES ON projectsend.* TO 'projectsenduser'@'localhost';
```
- Recharger les droits **MySQL**.
```sql
FLUSH PRIVILEGES;
```
- Quitter **MySQL**.
```sql
EXIT;
```
- Créer le fichier "**projectsend.conf** dans la configuration d'**Apache**.
```bash
sudo nano /etc/apache2/sites-available/projectsend.conf
```
- Ajouter la configuration suivante :
```conf
<VirtualHost *:80>
  ServerName yourdomain.com
  DocumentRoot /var/www/html/projectsend
  <Directory /var/www/html/projectsend>
    AllowOverride All
    Require all granted 
  </Directory>
</VirtualHost>
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Charger le nouvel virtual hotst créé.
```bash
sudo a2ensite projectsend.conf
```
- Redémarrer le service "**apache2**".
```bash
sudo systemctl restart apache2
```
- Donner les droits à l'utilisateur "**www-data**" sur le dossier "**projectsend**".
```bash
sudo chown -R www-data:www-data /var/www/html/projectsend/
sudo chmod -R 755 /var/www/html/projectsend/
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP/projectsend`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour