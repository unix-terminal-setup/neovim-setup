l#!/usr/bin/env bash

# Download nerd font
temp_directory=/tmp/neovim-setup
mkdir -p $temp_directory
cd $temp_directory
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
sudo apt install unzip
unzip JetBrainsMono.zip

# Install nerd font
font_directory=/usr/local/share/fonts/jetbrains-mono-nerd
sudo mkdir -p $font_directory
cd $font_directory
sudo cp $temp_directory/*.ttf .
sudo fc-cache -fv

# Install Hyper Terminal
rm -R $temp_directory
mkdir -p $temp_directory
cd $temp_directory
curl -O -J -L https://releases.hyper.is/download/deb
sudo apt install ./hyper*.deb

# Change Hyper Font
# Todo: fix sed command
sed -i "/fontFamily: '.*'/fontFamily: '"JetBrainsMono Nerd Font"'," ~/.hyper

# Install neovim dependencies
sudo apt install cmake
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs
sudo apt install python3-venv

# Install neovim
sudo snap install nvim --classic

# Run nvchad
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

echo "Run the following command in the hyper terminal:"
echo "git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim"

# Launch Hyper
hyper
