# Caddy
Your content here

## Présentation

## Installation
- Mettre à jour les dources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install -y debian-keyring debian-archive-keyring apt-transport-https curl -y
```
- Télécharger la clé GPG de **Caddy**.
```bash
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
```
- Ajouter les sources **Caddy**.
```bash
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
```
- Mettre à jour les dources.
```bash
sudo apt-get update
```
- Installer "**Caddy**"
```bash
sudo apt-get install caddy -y
```
- Activer le démarrage automatique de **Caddy**.
```bash
sudo systemctl enable caddy
```
- Démarrer le service **Caddy**.
```bash
sudo systemctl start caddy
```
- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour