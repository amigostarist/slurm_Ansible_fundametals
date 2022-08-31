#!/usr/bin/env bash

sudo yum update
sudo yum install epel-release
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
#firewall-cmd --zone=public --permanent --add-service=http
#firewall-cmd --zone=public --permanent --add-service=https
#firewall-cmd --reload
#if ! [ -L /var/www ]; then
 # rm -rf /var/www
#  ln -fs /centos /var/www
#fi
#sudo mkdir  /var/www/php-test
#sudo chown vagrant:vagrant /var/www/php-test/
sudo cp -r ~/admin/ /usr/share/nginx/html/
sudo mkdir -p /usr/share/nginx/html/php-test
sudo chown vagrant:vagrant  /usr/share/nginx/html/php-test
sudo echo "<?php phpinfo(); ?>" > php-test.php  /usr/share/nginx/html/php-test/
sudo yum install -y php-fpm
sudo systemctl start php-fpm