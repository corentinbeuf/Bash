# Gitlab
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get -y vim git wget curl
```
- Télécharger le script d'installation de **Gitlab** puis exécuter le.
```bash
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
```
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Editer le fichier "**locale.gen**".
```bash
sudo nano /etc/locale.gen
```
- Décommenter la ligne `# en_US.UTF-8 UTF-8`.
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Appliquer les modifications.
```bash
sudo locale-gen
```
- Installer Gitlab.
```bash
sudo apt-get install -y gitlab-ce
```
- Editer le fichier "**gitlab.rb**".
```bash
sudo nano /etc/gitlab/gitlab.rb
```
- Modifier le champ `gitlab.example.com` par l'adresse IP du serveur ou son FQDN.
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Reconfigurer Gitlab.
```bash
sudo gitlab-ctl reconfigure
```
- Afficher le mot de passe du compte root.
```bash
sudo cat /etc/gitlab/initial_root_password
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP` ou `http://FQDN`.

## Configuration

## Sauvegarde

## Restauration

## Mise à jour