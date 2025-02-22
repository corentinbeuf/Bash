#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
apt-get update -y > /dev/null
echo "--------------------------------"
echo " Install requierements packages "
echo "--------------------------------"
apt-get install ca-certificates curl gnupg -y > /dev/null
echo "---------------------------"
echo " Create folder for GPG key "
echo "---------------------------"
install -m 0755 -d /etc/apt/keyrings
echo "-------------------------"
echo " Download Docker GPG key "
echo "-------------------------"
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "-------------------"
echo " Setup permissions "
echo "-------------------"
chmod a+r /etc/apt/keyrings/docker.gpg
echo "-------------------"
echo " Add Docker source "
echo "-------------------"
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
apt-get update -y  > /dev/null
echo "-------------------------"
echo " Install Docker packages "
echo "-------------------------"
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y > /dev/null