#!/bin/bash

sudo apt-get install cowsay
sudo apt-get install fortune
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./.vimrc ~
echo -en \\nconfiguration for random animals\\nif [-x /usr/games/cowsay -a -x /usr/games/fortune ]\; then\\n\\tfortune \| cowsay -f \`ls -l /usr/share/cowsay/cows/ \| sort -R \| head -l\` -n\\n\\tfi\\n >> ~/.bashrc
