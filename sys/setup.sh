#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install openssh-server
sudo service sshd restart
git clone https://github.com/sukiand/dotfiles.git ~/Project/git/config
