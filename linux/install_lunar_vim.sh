#!/bin/bash

######## INSTALL LUNAR VIM ###########
#git make pip node cargo
install_command_with_apt git
install_command_with_apt make
install_command_with_apt python3
install_command_with_apt python3-pip

# node
if ! which node &>/dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&
        sudo apt-get install -y nodejs
    # Resolving EACCES permissions errors
    mkdir "$HOME/.npm-global"
    npm config set prefix "$HOME/.npm-global"
    export "PATH=$HOME/.npm-global/bin:$PATH"
    echo "export PATH=$HOME/.npm-global/bin:\$PATH" >>"$HOME/.bashrc"

fi

# install cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
# Dejo de andar la instalación del manual por eso use apt.
# if ! which cargo; then sudo apt install cargo -y; fi

# lazygit para mejor experiencia con git

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz

###### Install Neovim v0.9.0+ ######
latest_version_neovim=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')
download_url="https://github.com/neovim/neovim/releases/download/$latest_version_neovim/nvim-linux64.tar.gz"
path_nvim="/usr/local/bin"
sudo curl -sL "$download_url" | sudo tar xz -C "$path_nvim"
sudo ln -s "$path_nvim"/nvim-linux64/bin/nvim "$path_nvim"/nvim

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) <<-EOF
    y
    y
    y
EOF

export "PATH=$HOME/.local/bin:$PATH"
echo "export \"PATH=$HOME/.local/bin:\$PATH\"" >>"$HOME/.bashrc"

if ! echo "$PATH" | grep '.cargo/bin:'; then
    export "PATH=/home/cosmo/.cargo/bin:$PATH"
    echo "export \"PATH=$HOME/.cargo/bin:\$PATH\"" >>"$HOME/.bashrc"
fi

lvim +TSUpdate +qall
