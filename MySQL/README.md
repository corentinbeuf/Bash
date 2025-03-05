# MySQL
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer Gnupg.
```bash
sudo apt-get install -y gnupg2
```
- Télécharger la dernière version de MySQL.
```bash
wget -q https://repo.mysql.com/mysql-apt-config_0.8.33-1_all.deb
```
- Installer le paquet **DEB** de MySQL.
```bash
sudo dpkg -i mysql-apt-config_0.8.33-1_all.deb
```
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer MySQL.
```bash
sudo apt-get install mysql-server -y
```
- Démarrer le service "**mysql**".
```bash
sudo systemctl restart mysql
```
- Activer le démarrage automatique du service "**mysql**".
```bash
sudo systemctl enable mysql
```

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/MySQL/install_mysql.sh)
{.links-list}

## Configuration

## Sauvegarde

## Restauration

## Mise à jour