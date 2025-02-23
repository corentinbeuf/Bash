#!/bin/bash
read -p "Enter MySQL password : " mysql_password
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update > /dev/null
echo "----------------------"
echo " Install requirements "
echo "----------------------"
sudo apt-get install gnupg -y > /dev/null
echo "----------------"
echo " Download MySQL "
echo "----------------"
wget -q https://repo.mysql.com/mysql-apt-config_0.8.33-1_all.deb
echo "----------------------"
echo " Add MySQL repository "
echo "----------------------"
sudo DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.33-1_all.deb > /dev/null
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update > /dev/null
echo "---------------"
echo " Install MySQL "
echo "---------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y > /dev/null
echo "---------------"
echo " Enable MySQL "
echo "---------------"
sudo systemctl enable mysql
echo "---------------"
echo " Restart MySQL "
echo "---------------"
sudo systemctl restart mysql