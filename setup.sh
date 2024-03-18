#!/usr/bin/env bash

# Install neovim dependencies
echo "Installing NeoVim dependencies"
sudo apt install cmake
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs
sudo apt install python3-venv

# Install neovim
sudo snap install nvim --classic

# Remove vim if installed:
echo "Removing 'vim' from system"
sudo apt remove -y --purge vim vim-*

# Setup alias for nvim to vim:
echo "Adding an alias for nvim to vim"
echo 'alias vim="nvim"' >>~/.bashrc

# Test installation was successful:
nvim --help | echo "Successfully install NeoVim"
