#!/bin/bash

apt-get install -y wget lsb-release
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
sudo apt-get -y update && sudo apt-get -y install gcc make dkms
sudo apt-get -y install virtualbox
sudo apt-get install -y virtualbox-ext-pack
