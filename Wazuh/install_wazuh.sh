#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y
echo "-------------------------"
echo " Install 'curl' packages "
echo "-------------------------"
sudo apt-get install curl -y > /dev/null
echo "---------------"
echo " Install Wazuh "
echo "---------------"
curl -sO https://packages.wazuh.com/4.11/wazuh-install.sh && sudo bash ./wazuh-install.sh -a