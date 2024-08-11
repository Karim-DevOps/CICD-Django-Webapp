#!/bin/bash

sudo apt install nginx -y

sudo chmod -R 777 /usr/jenkins/workspace/django-project/

sudo rm -rf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*

sudo cp -rf polling.conf /etc/nginx/sites-available/polling

sudo ln -s /etc/nginx/sites-available/polling /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl restart nginx
echo "Nginx has been started"

sudo systemctl status nginx

