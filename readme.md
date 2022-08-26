Task: Create virtual machine and setup LEMP.
 

Step: Create enviroment:

	1.1 Install for your machine hypervisor (hyper-V, Vmware, VirtualBox and etc.) 
If you use Windows(8, 10, 11) Pro version, you can use hyper-v component include in your OS.
If you use other version windows, you must find and download this software.
-Virtualbox https://www.virtualbox.org/wiki/Downloads
-Vmware https://customerconnect.vmware.com/en/downloads/#all_products

In GNU/Linux OS for  installation nesessary software you can use 2 ways:
- download packages in website producent software. For Ubuntu # sudo apt install /"path .deb" or dubleclick on downloaded package
- with help package manager in your OS (apt, yum and etc.)

#########################!!! REMEMBERS !!!################################
On BIOS your machine must be include support virtualization(AMD-V or VT-X). 
##########################################################################
 
	1.2 Install vagrant #sudo apt install vagrant -y

Step: create project: 

	2.1 Create folder for project # mkdir "project"
	2.2 Enter this folder # cd ~/"project"
	2.3 Iniciate # vagrant init
	2.4 Check status # vagrant status. You can see, what vagrant create new files. And VM not created
	2.5 Edit VagrantFile. Write needed properties for your VM
	2.6 Create & Start VM # vagrant up
	2.7 Enter to the VM # vagrant ssh

Step: Preperetions VM:

	3.1 For preparations VM, we must update list repository in package manager. # sudo apt update 

Step: Install webserver on VM, and setup:

	4.1. Install nginx on Ubuntu # sudo apt install nginx -y
	4.2. And now we can verified work nginx. For them open your browser and enter in adress string "localhost:8080"
	4.3. Setup access rigths on folder with our site # sudo chown vagrant:vagrant /var/www/html
	4.4. Exit at the VM # exit or press Ctrl+D
	4.5. Create folder materials and other files # mkdir dist
	4.6. Move you materials in ./dist
	4.7. Upload materials on VM # vagrant upload ./dist /var/www/html

Step: Install MySQL:

	5.1. Install MySQL # sudo apt install -y mysql-server
	5.2. Verified what service work # sudo sysytemctl --type=service 
	5.3. Create user and password # mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'password';
	5.4. make DB more secure # sudo mysql_secure_installation

Securing the MySQL server deployment.

Enter password for user root: 

VALIDATE PASSWORD COMPONENT can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD component?

Press y|Y for Yes, any other key for No: No
Using existing password for root.
Change the password for root ? ((Press y|Y for Yes, any other key for No) : No

 ... skipping.
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : No

 ... skipping.
By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
Success.

All done! 



test-connection.phptest-connection.php	5.5. Enter to DB # mysql -u root -p
		enter password
	5.6. now we see who & how can enter to DB # mysql 
		SELECT user, plugin FROM mysql.user;

Step: Install php:
	
	6.1. Install php # sudo apt install -y php-fpm php-mysql
	6.2. Check version php # php --version

Step: Create configuration for testing php:

	7.1. #cd /etc/nginx/sites-available
	7.2. create config file # vim php_test.conf OR copyes sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/php_test.conf
sudo vim  /etc/nginx/sites-available/php_test.conf
	7.3. Write needed properties in php_test:
server {
        listen 80;
        root /var/www/php_test;
        index index.php index.html index.htm index.nginx-debian.html; # определяем индексный файл по умолчанию, в нашем случае мы хотим index.php
        server_name php-test.com;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {  # для любого окончания .php по запросу мы применяем правила этого блока
                include snippets/fastcgi-php.conf; # включаем конфигурацию для php
                fastcgi_pass unix:/var/run/php/php7.4-fpm.sock; # обрабатываем с помощью fpm, передавая данные в файловый сокет и получая их обратно
        }
}

	7.4. Create symbol link # sudo ln -s /etc/nginx/sites-available/php_test.conf /etc/nginx/sites-enabled/php_test
	7.5. Check configuration nginx # sudo nginx -t
	7.6. Reload server # sudo nginx -s reload 
	7.7. Create folder # sudo mkdir /var/www/php-test
	7.8. Change owner for folder # sudo chown vagrant:vagrant /var/www/php-test
	7.9. Create test php file # echo "<?php phpinfo(); ?>" > /var/www/php-test/index.php
open your browser and enter in address string "php-test.com:8080"
	7.10. Edit host file in your computer # echo "127.0.0.1 php-test.com" >> /etc/hosts
	7.11. Check work php with mysql # sudo cp ./test-connection.php /var/www/php-test
open your browser and enter in address string "php-test.com:8080/connection.php"
 
