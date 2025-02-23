#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update > /dev/null
echo "-----------------------"
echo " Install requierements "
echo "-----------------------"
sudo apt-get install default-jre gnupg2 apt-transport-https wget curl -y > /dev/null
echo "--------------------"
echo " Check Java version "
echo "--------------------"
java -version
echo "-------------------"
echo " Download key file "
echo "-------------------"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "------------"
echo " Add source "
echo "------------"
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update > /dev/null
echo "-----------------"
echo " Install Jenkins "
echo "-----------------"
sudo apt-get install jenkins -y > /dev/null
echo "---------------"
echo " Show password "
echo "---------------"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword