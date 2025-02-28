#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update > /dev/null
echo "---------------------------------"
echo " Download latest ADGuard version "
echo "---------------------------------"
wget -q https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.46/AdGuardHome_linux_amd64.tar.gz
echo "---------------"
echo " Unzip archive "
echo "---------------"
sudo tar -xf AdGuardHome_linux_amd64.tar.gz
echo "-----------------"
echo " Install ADGuard "
echo "-----------------"
cd AdGuardHome/
sudo ./AdGuardHome -s install
