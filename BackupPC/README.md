    # BackupPC
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer **BackupPC**.
```bash
sudo apt-get backuppc -y
```
- Modifier le mot de passe du compte "**backuppc**".
```bash
sudo htpasswd /etc/backuppc/htpasswd backuppc
```
- Editer le fichier "**apache.conf**" de **BackupPC**.
```bash
sudo nano /etc/backuppc/apache.conf
```
- Commenter la ligne `Require local`.
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Redémarrer le service "**apache2**".
```bash
sudo systemctl restart apache2
```
- Redémarrer le service "**backuppc**".
```bash
sudo systemctl restart backuppc
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP/backuppc`

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/BackupPC/install_backuppc.sh)
{.links-list}

## Configuration

## Sauvegarde

## Restauration

## Mise à jour