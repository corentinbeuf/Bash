# Stork
Your content here

## Présentation

## Installation
- Mettre à jour les dources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install curl -y
```
- Installer **PostgreSQL**.
```bash
sudo apt-get install postgresql -y
```
- Ajouter les sources **Stork**.
```bash
curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | sudo bash
```
- Installer **Stork**
```bash
sudo apt-get install isc-stork-server -y
```
- Se rendre sur la session de l'utilisateur "**postgres**".
```bash
sudo su - postgres
```
- Créer la base de données ainsi que l'utilisateur de la base de données.
```bash
sudo stork-tool db-create --db-name stork --db-user stork-server
```
- Garder les informations liées à la base de données dans un fichier.
- Sortir de la session de l'utilisateur "**postgres**".
```bash
exit
```
- Editer le fichier d'environnement.
```bash
sudo nano /etc/stork/server.env
```
- Modifier les champs suivants dans le fichier :
	- `STORK_DATABASE_NAME`
  - `STORK_DATABASE_USER_NAME`
  - `STORK_DATABASE_PASSWORD`
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pous sauvegarder puis quitter le fichier.
- Activer le démarrage automatique de **Stork**.
```bash
sudo systemctl enable isc-stork-server
```
- Démarrer le service **Stork**.
```bash
sudo systemctl start isc-stork-server
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:8080`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour