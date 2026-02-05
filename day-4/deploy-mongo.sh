#!/bin/bash

# update packages
sudo apt update -y

# upgrade packages
sudo apt upgrade -y

# install gnupg and curl
sudo apt install gnupg curl -y

# add the GPG key which signs the MongoDB packages to ensure they are authentic
# add --yes flag to overwrite the exisiting key
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
    --dearmor \
    --yes

# create the source list file for Ubuntu 22.04
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# update packages again
sudo apt update -y

# install mongodb
sudo apt install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

# verify installation/version
echo mongod --version

# install sed
sudo apt install sed -y

# Update mongodb configuration to bind to all IP addresses
# sudo nano /etc/mongod.conf
sudo sed -i 's/bindIp: 127.0.0.1/bingIp: 0.0.0.0/' /etc/mongod.conf

# start mongodb
# by default will not be started
sudo systemctl start mongod

# NOTE - potential permissions error, so switching to mongo
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown mongodb:mongodb /tmp/mongodb-27017.sock

# enable mongodb to start on boot
# by default will not be enabled
sudo systemctl enable mongod

# restart mongodb
sudo systemctl restart mongod



