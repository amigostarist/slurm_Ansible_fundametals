sudo yum update
   sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
    8  sudo systemctl enable nginx
    9  sudo yum install mariadb-server mariadb -y
   10  sudo systemctl start mariadb
   11  sudo systemctl enable mariadb
   12  sudo mysql_secure_installation
   13  sydo mysql
   14  sudo mysql
   15  sudo rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
   16  sudo yum install yum-utils
   17  sudo yum-config-manager --enable remi-php73
   18  sudo yum install php73 -y
   19  sudo yum install php-fpm php-mysql php-cli php-mbstring php-opcache php-curl php-gd -y
   20  systemctl start php-fpm
   21  systemctl enable php-fpm
   22  nano /etc/php.ini
   23  sudo vi /etc/php.ini
   24  sudo vi /etc/php-fpm.d/www.conf
   25  sudo systemctl restart php-fpm
   26  sudo vi /etc/nginx/nginx.conf
   27  sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
   28  sudo echo "<?php phpinfo(); ?>" > /usr/share/nginx/html
   29  sudo vi /var/www/html/info.php
   30  sudo cat /var/www/html/info.php
   31  sudo touch /var/www/html/info.php
   32  sudo > /var/www/html/info.php
   33  cd /var/www/html/info.php
   34  sudo mkdir -p /var/www/html/
   35  sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
   36  sudo vi /var/www/html/info.php
   37  sudo systemctl restart nginx
   38  sudo vi /etc/nginx/nginx.conf
   39  nginx -t
   40  sudo chown -R vagrant:vagrant /var/log/nginx;
   41  sudo chmod -R 755 /var/log/nginx;
   42  nginx -t
   43  sudo systemctl restart nginx
   44  sudo vi /etc/nginx/nginx.conf
   45  sudo systemctl restart nginx
   46  nginx -t
   47  sudo yum mysql-server
   48  sudo echo "<?php phpinfo(); ?>" > /usr/share/nginx/html
   49  sudo echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php
   50  sudo chown vagrant:vagrant /usr/share/nginx/html
   51  sudo echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php
   52  cd /var/www/html
   53  ll
   54  cat info.php 
   55  sudo rm info.php 
   56  cd ..
   57  rm -r html/
   58  sudo rm -r html/
   59  sudo vi /etc/nginx/nginx.conf
   60  nginx -s reload
   61  sudo vi /etc/nginx/nginx.conf
   62  nginx -s reload
   63  systemctl restart nginx
   64  sudo cp /etc/nginx/nginx.conf ~/

