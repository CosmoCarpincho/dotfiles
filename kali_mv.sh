#!/bin/bash

source funciones_genericas.sh

route_user="$HOME"
route_bashrc="$route_user/.bashrc"
route_zshrc="$route_user/.zshrc"
route_fonts="/usr/share/fonts"
cosmo_fonts="$route_fonts/cosmo_fonts"

# update y upgrade
sudo apt update -y && sudo apt upgrade -y

# Icons
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
mkdir temp_cosmo
mv NerdFontsSymbolsOnly.zip temp_cosmo
unzip ./temp_comso/NerdFontsSymbolsOnly.zip
mv ./temp_cosmo/* $cosmo_fonts

## Meslo Nerd Font (oh my zsh) ##
install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'

# Mis config
echo -e "\n#Mis configs:\n" >>$route_zshrc
alias 'g=https://github.com'
echo 'alias g=https://github.com' >>$route_zshrc

if [ ! -d $cosmo_fonts ]; then
    mkdir -p $cosmo_fonts
fi

#batcat
sudo apt install bat -y
echo "alias cat=$(which batcat)" >>$route_zshrc
alias "cat=$(which batcat)"

#lsd
sudo apt install lsd -y
echo "alias ls=lsd" >>$route_zshrc
alias ls='lsd'

# lvim
source install_lunar_vim.sh
