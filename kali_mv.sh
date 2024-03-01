#!/bin/bash

route_user='$HOME'
route_bashrc="$route_user/.bashrc"
route_zsh="$route_user/.zshrc"

# update y upgrade
sudo apt update && sudo apt upgrade
#batcat

sudo apt install bat
alias "cat=$(which batcat)"
echo -e "\n#Mis configs:\n" >>$route_zsh
echo "\nalias cat=$(which batcat)\n" >>$route_zsh

#lsd

# lvim

source install_lunar_vim.sh
