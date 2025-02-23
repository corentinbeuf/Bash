#!/bin/bash
read -p "Enter IP address of server : " address
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y > /dev/null
echo "-----------------"
echo " Install NetData "
echo "-----------------"
sudo apt-get install netdata -y > /dev/null
echo "----------------"
echo " Enable service "
echo "----------------"
sudo systemctl enable netdata
echo "--------------------------------------"
echo " Add IP address in configuration file "
echo "--------------------------------------"
sudo sed -i "s/127.0.0.1/${address}/g" /etc/netdata/netdata.conf
echo "-----------------"
echo " Restart service "
echo "-----------------"
sudo systemctl restart netdata