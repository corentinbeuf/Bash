#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y
echo "-----------------------"
echo " Install requierements "
echo "-----------------------"
sudo apt-get install gnupg2 curl -y > /dev/null
echo "------------------"
echo " Download GPG key "
echo "------------------"
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo gpg --dearmor > /etc/apt/trusted.gpg.d/jcameron-key.gpg
echo "-------------"
echo " Add sources "
echo "-------------"
sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y
echo "----------------"
echo " Install webmin "
echo "----------------"
sudo apt-get install webmin -y > /dev/null
echo "----------------------"
echo " Start webmin service "
echo "----------------------"
sudo systemctl start webmin
echo "-----------------------"
echo " Enable webmin service "
echo "-----------------------"
sudo systemctl enable webmin