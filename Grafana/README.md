# Grafana
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install -y gnupg2 apt-transport-https software-properties-common wget
```
- Créer le dossier "**/etc/apt/keyrings**".
```bash
sudo mkdir -p /etc/apt/keyrings/
```
- Télécharger la clé GPG de Grafana.
```bash
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg
```
- Donner les droits de lecture sur la clé.
```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
- Ajouter Grafana dans les sources de la machine virtuelle.
```bash
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer Grafana.
```bash
sudo apt-get install grafana-server -y
```
- Démarrer le service "**grafana-server**".
```bash
sudo systemctl restart grafana-server
```
- Activer le démarrage automatique du service "**grafana-server**".
```bash
sudo systemctl enable grafana-server
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:3000`

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Grafana/install_grafana.sh)
{.links-list}

## Configuration

## Sauvegarde

## Restauration

## Mise à jour