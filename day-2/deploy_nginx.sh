#!/bin/bash

# update packages
sudo apt update -y

# upgrade packages
sudo apy upgrade -y

# install nginx
sudo apt install nginx -y

# status of nginx
# sudo systemctl status nginx

# restart nginx
sudo systemctl restart nginx

# enable nginx to start on boot
sudo systemctl enable nginx