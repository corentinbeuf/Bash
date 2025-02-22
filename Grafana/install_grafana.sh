#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y > /dev/null
echo "-----------------------"
echo " Install requierements "
echo "-----------------------"
sudo apt-get install -y gnupg2 apt-transport-https software-properties-common wget > /dev/null
echo "---------------------------"
echo " Create folder for GPG key "
echo "---------------------------"
sudo mkdir -p /etc/apt/keyrings/
echo "--------------------------"
echo " Download Grafana GPG key "
echo "--------------------------"
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "--------------------"
echo " Add Grafana source "
echo "--------------------"
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list > /dev/null
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y > /dev/null
echo "-----------------"
echo " Install Grafana "
echo "-----------------"
sudo apt-get install -y grafana > /dev/null
echo "-----------------------"
echo " Start Grafana service "
echo "-----------------------"
sudo systemctl start grafana-server
echo "------------------------"
echo " Enable Grafana service "
echo "------------------------"
sudo systemctl enable grafana-server