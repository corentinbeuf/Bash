# NetData
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer NetData.
```bash
sudo apt-get install netdata -y
```
- Activer le démarrage automatique du service "**netdata**".
```bash
sudo systemctl enable netdata
```
- Editer le fichier "**netdata.conf**".
```bash
sudo nano /etc/netdata/netdata.conf
```
- Remplacer le champ `127.0.0.1` par l'adresse IP du serveur.
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Redémarrer le service "**netdata**".
```bash
sudo systemctl restart netdata
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:19999`

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Netdata/install_netdata.sh)
{.links-list}

## Configuration

## Sauvegarde

## Restauration

## Mise à jour