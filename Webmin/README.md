# Webmin
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install -y gnupg2 curl
```
- Télécharger la clé GPG de Webmin.
```bash
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo gpg --dearmor > /etc/apt/trusted.gpg.d/jcameron-key.gpg
```
- Ajouter Webmin dans les sources de la machine virtuelle.
```bash
sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
```
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer Webmin.
```bash
sudo apt-get install webmin -y
```
- Démarrer le service "**webmin**".
```bash
sudo systemctl start webmin
```
- Activer le démarrage automatique du service "**webmin**".
```bash
sudo systemctl enable webmin
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `https://IP:10000`

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Webmin/install_webmin.sh)

## Configuration
- Aucune configuration spécifique à apporter.

## Sauvegarde
- Aucune sauvegarde nécessaire.

## Restauration
- Pas de restauration du service car aucune sauvegarde n'est réalisée.

## Mise à jour
- Mettre à jour les sources du serveur.
```bash
sudo apt-get update
```
- Installer les paquets à mettre à jour.
```bash
sudo apt-get upgrade -y
```