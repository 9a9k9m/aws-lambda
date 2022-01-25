#!/bin/bash
sudo apt update 
sudo apt install apache2 -y
sudo systemctl status apache2
sudo systemctl start apache2
sudo ufw allow in "apache"
sudo apt install mariadb-server -y
sudo systemctl status mariadb
sudo systemctl start mariadb
sudo apt install php php-mysql -y