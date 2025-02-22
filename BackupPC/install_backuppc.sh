#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y > /dev/null
echo "------------------"
echo " Install packages "
echo "------------------"
# TODO : ajouter DEBIANFRONTEND=noninteractive puis la remetre correctement après l'install
sudo DEBIAN_FRONTEND=noninteractive apt-get install backuppc rsync apache2 -y > /dev/null
echo "----------------------------------"
echo " Change password of backuppc user "
echo "----------------------------------"
sudo htpasswd /etc/backuppc/htpasswd backuppc
echo "-----------------------------"
echo " Change apache configuration "
echo "-----------------------------"
sudo sed -i "s/Require local/#Require local/g" /etc/backuppc/apache.conf
echo "-------------------------"
echo " Restart apache2 service "
echo "-------------------------"
sudo systemctl restart apache2
echo "--------------------------"
echo " Restart BackupPC service "
echo "--------------------------"
sudo systemctl restart apache2