# ISPconfig
Your content here

## Présentation

## Installation
- Editer le fichier "**hosts**".
```bash
sudo nano /etc/hosts
```
- Dans le champ "**127.0.1.1**", faire correspondre le FQDN du serveur, exemple : `127.0.1.1 ispconfig.cbf.fr ispconfig`.
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pous sauvegarder puis quitter le fichier.
- Editer le fichier "**hostname**".
```bash
sudo nano /etc/hostname
```
- Définir le nom du serveur.
- Redémarrer la machine virtuelle.
```bash
sudo reboot
```
- Lorsque le serveur a redémarré, exécuter le script suivant :
```bash
wget -O - https://get.ispconfig.org | sudo sh -s --
```
- Pour se connecter aux différentes pages, se connecter sur :
	- ISPconfig : `https://FQDN:8080`
  - PHPmyAdmin : `http://IP/phpmyadmin`

## Configuration

## Sauvegarde

## Restauration

## Mise à jour