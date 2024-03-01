#!/bin/bash

route_user="$HOME"
route_bashrc="$route_user/.bashrc"
route_zshrc="$route_user/.zshrc"

# update y upgrade
sudo apt update && sudo apt upgrade
#batcat

sudo apt install bat
alias "cat=$(which batcat)"
echo -e "\n#Mis configs:\n" >>$route_zshrc
echo "alias cat=$(which batcat)" >>$route_zshrc

#lsd

sudo apt install lsd
alias ls='lsd'

echo "alias ls=lsd" >> $route_zshrc

# lvim

source install_lunar_vim.sh
