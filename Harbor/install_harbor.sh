#!/bin/bash
read -p "Enter URL to access to Harbor interface (IP ou FQDN) : " harborHostname
echo "---------------------------------"
echo " Uninstall old version of Docker "
echo "---------------------------------"
sudo apt-get remove docker docker-engine docker.io containerd runc -y > /dev/null
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y
echo "--------------------------------"
echo " Install requierements packages "
echo "--------------------------------"
sudo apt-get install ca-certificates curl gnupg -y > /dev/null
echo "---------------------------"
echo " Create folder for GPG key "
echo "---------------------------"
sudo mkdir -m 0755 -p /etc/apt/keyrings
echo "-------------------------"
echo " Download Docker GPG key "
echo "-------------------------"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "-------------------"
echo " Add Docker source "
echo "-------------------"
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y
echo "-------------------------"
echo " Install Docker packages "
echo "-------------------------"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y > /dev/null
echo "------------------------------------"
echo " Download Docker-Compose repository "
echo "------------------------------------"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "---------------------------"
echo " Chmod Docker-Compose file "
echo "---------------------------"
sudo chmod +x /usr/local/bin/docker-compose
echo "----------------------"
echo " Create symbolic link "
echo "----------------------"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "---------------------------"
echo " Download & Install Harbor "
echo "---------------------------"
curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '\.tgz$' | wget -i -
echo "--------------------------"
echo " Unarchive Harbor archive "
echo "--------------------------"
sudo tar xvzf harbor-offline-installer*.tgz
echo "-------------------------"
echo " Copy configuration file "
echo "-------------------------"
sudo cp harbor/harbor.yml.tmpl harbor/harbor.yml
echo "-----------------------------"
echo " Change Harbor configuration "
echo "-----------------------------"
sudo sed -i "s/hostname: reg.mydomain.com/hostname: ${harborHostname}/g" /root/harbor/harbor.yml
sudo sed -i "s/  port: 443/#  port: 443/g" /root/harbor/harbor.yml
sudo sed -i "s/https:/#https:/g" /root/harbor/harbor.yml
sudo sed -i "s/  certificate: \/your\/certificate\/path/#  certificate: \/your\/certificate\/path/g" /root/harbor/harbor.yml
sudo sed -i "s/  private_key: \/your\/private\/key\/path/#  private_key: \/your\/private\/key\/path/g" /root/harbor/harbor.yml
echo "------------------------------"
echo " Prepare Harbor configuration "
echo "------------------------------"
sudo ./harbor/prepare
echo "----------------"
echo " Install Harbor "
echo "----------------"
sudo ./harbor/install.sh