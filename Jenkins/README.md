# Jenkins
Your content here

## Présentation

## Installation
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer les paquets prérequis.
```bash
sudo apt-get install default-jre gnupg2 apt-transport-https wget curl -y
```
- Vérifier que java est installé.
```bash
java --version
```
- Télécharger la clé public de Jenkins.
```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc
```
- Ajouter Jenkins dans les sources de la machine virtuelle.
```bash
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list
```
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer Jenkins.
```bash
sudo apt-get install jenkins -y
```
- Récupérer le mot de passe généré lors de l'installation.
```bash
sudo /var/lib/jenkins/secrets/initialAdminPassword
```

- Se connecter sur l'adresse suivante pour accéder à l'application : `http://IP:8080`

### Scripts d'installation
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Jenkins/install_jenkins.sh)
{.links-list}

## Configuration

## Sauvegarde

## Restauration

## Mise à jour