#!/bin/bash
read -p "Enter IP address of server : " address
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update
echo "-----------------------"
echo " Install requierements "
echo "-----------------------"
sudo apt-get install -y vim git wget curl > /dev/null
echo "-------------------------"
echo " Download Gitlab scripts "
echo "-------------------------"
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update
echo "-----------------"
echo " Setup variables "
echo "-----------------"
sudo sed -i "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
sudo locale-gen
echo "----------------"
echo " Install Gitlab "
echo "----------------"
sudo apt-get install -y gitlab-ce > /dev/null
echo "-------------------"
echo " Set-up Gitlab URL "
echo "-------------------"
sudo sed -i s/"gitlab.example.com"/"${address}"/g /etc/gitlab/gitlab.rb
echo "--------------"
echo " Start Gitlab "
echo "--------------"
sudo gitlab-ctl reconfigure
echo "----------------------"
echo " Show Gitlab password "
echo "----------------------"
sudo cat /etc/gitlab/initial_root_password