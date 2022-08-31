#!/usr/bin/env bash

yum update
yum install epel-release
yum install -y nginx
systemctl start nginx
systemctl enable nginx
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /centos /var/www
fi