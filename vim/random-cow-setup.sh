#!/bin/bash

sudo yum install cowsay
sudo yum install fortune
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./.vimrc ~
echo -en \\n#configuration for random animals\\nif [ -x /usr/games/cowsay -a -x /usr/games/fortune ]\; then\\n\\tfortune \| cowsay -f \`ls -1 /usr/share/cowsay/cows/ \| sort -R \| head -1\` -n\\n\\tfi\\n >> ~/.bashrc
