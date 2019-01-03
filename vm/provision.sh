#!/bin/bash
source /vm/script/vagrant/util.sh
clear

print_green "Update ..."
sudo apt-get update -y
sudo apt-get upgrade -y

# ----------------------------------------------------------------------------------------------------------------------
# Nginx
# ----------------------------------------------------------------------------------------------------------------------
print_green "Install nginx ..."
sudo apt-get install nginx -y
# Fix vagrant file sync bug...
sudo sed -i -e 's/sendfile on/sendfile off/g' /etc/nginx/nginx.conf

# ----------------------------------------------------------------------------------------------------------------------
# PHP
# ----------------------------------------------------------------------------------------------------------------------
print_green "Install php ..."
sudo apt-add-repository ppa:ondrej/php -y
sudo apt-get update -y
sudo apt-get install php7.2-fpm -y
sudo apt-get install php7.2-zmq -y
sudo apt-get install php7.2-xdebug -y

# ----------------------------------------------------------------------------------------------------------------------
# Tools: Zip, Git, Composer
# ----------------------------------------------------------------------------------------------------------------------
print_green "Install tools ..."
sudo apt-get install zip -y
sudo apt-get install git -y
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer;

# ----------------------------------------------------------------------------------------------------------------------
# Redis
# ----------------------------------------------------------------------------------------------------------------------
print_green "Install redis..."
sudo apt-get install redis-server -y
sudo apt-get install php7.2-redis -y

# ----------------------------------------------------------------------------------------------------------------------
# MySQL
# ----------------------------------------------------------------------------------------------------------------------
print_green "Install mysql (user 'root' / pw 'root')..."
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install mysql-server -y
sudo apt-get install php7.2-mysql -y

# ----------------------------------------------------------------------------------------------------------------------
# NodeJS & NPM
# ----------------------------------------------------------------------------------------------------------------------
print_green "Install nodejs & npm"
# Adding the NodeSource APT repository for Debian-based distributions repository AND the PGP key for verifying packages
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# Install Node.js from the Debian-based distributions repository
sudo apt-get install -y nodejs
# Get the most up-to-date npm
sudo npm install npm --global
