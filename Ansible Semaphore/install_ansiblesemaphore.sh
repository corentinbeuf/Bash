#!/bin/bash
read -p "Enter password for database user : " semaphorePassword
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update > /dev/null
echo "-----------------------"
echo " Install requierements "
echo "-----------------------"
sudo apt-get install git curl wget software-properties-common ansible postgresql nginx sudo -y > /dev/null
echo "-----------------------"
echo " Create semaphore user "
echo "-----------------------"
sudo -u postgres psql -c "CREATE USER semaphore WITH PASSWORD '${semaphorePassword}';"
echo "---------------------------"
echo " Create semaphore database "
echo "---------------------------"
sudo -u postgres psql -c "CREATE DATABASE semaphoredb OWNER semaphore;"
echo "---------------------------------"
echo " Download latest ADGuard version "
echo "---------------------------------"
VER=$(curl -s https://api.github.com/repos/semaphoreui/semaphore/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/v//g')
wget -q https://github.com/semaphoreui/semaphore/releases/download/v${VER}/semaphore_${VER}_linux_amd64.deb
echo "---------------------------"
echo " Install Ansible Semaphore "
echo "---------------------------"
VER=$(curl -s https://api.github.com/repos/semaphoreui/semaphore/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/v//g')
sudo dpkg -i semaphore_${VER}_linux_amd64.deb > /dev/null
echo "-----------------------------------------"
echo " Check if Ansible Semaphore is installed "
echo "-----------------------------------------"
sudo which semaphore
echo "---------------------------------"
echo " Create Ansible Semaphore folder "
echo "---------------------------------"
sudo mkdir -p /etc/semaphore
echo "-------------------------"
echo " Setup Ansible Semaphore "
echo "-------------------------"
cd /etc/semaphore
sudo semaphore setup
echo "----------------------------------"
echo " Create Ansible Semaphore service "
echo "----------------------------------"
sudo echo "[Unit]
Description=Semaphore Ansible
Documentation=https://github.com/ansible-semaphore/semaphore
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/bin/semaphore service --config=/etc/semaphore/config.json
SyslogIdentifier=semaphore
Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/semaphore.service
echo "----------------"
echo " Restart daemon "
echo "----------------"
sudo systemctl daemon-reload
echo "----------------------------------"
echo " Enable Ansible Semaphore service "
echo "----------------------------------"
sudo systemctl enable semaphore
echo "----------------------------------------"
echo " Create Ansible Semaphore conf in Nginx "
echo "----------------------------------------"
sudo echo "upstream semaphore {
    server 127.0.0.1:3000;
  }

server {
    listen 80;
    server_name auto.howtoforge.local;
      client_max_body_size 0;
      chunked_transfer_encoding on;

    location / {
      proxy_pass http://semaphore/;
      proxy_set_header Host \$http_host;
      proxy_set_header X-Real-IP \$remote_addr;
      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;

      proxy_set_header X-Forwarded-Proto \$scheme;

      proxy_buffering off;
      proxy_request_buffering off;
    }

    location /api/ws {
      proxy_pass http://semaphore/api/ws;
      proxy_http_version 1.1;
      proxy_set_header Upgrade \$http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header Origin "";
    }
}" > /etc/nginx/sites-available/semaphore.conf
echo "----------------------"
echo " Create symbolic link "
echo "----------------------"
sudo ln -s /etc/nginx/sites-available/semaphore.conf /etc/nginx/sites-enabled/
echo "--------------------"
echo " Check Nginx config "
echo "--------------------"
sudo nginx -t
echo "---------------"
echo " Restart Nginx "
echo "---------------"
sudo systemctl restart nginx