#!/usr/bin/env bash

# OS Dependencies
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Linux detected."
  sudo apt install cmake python3-venv -y
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Mac detected."    
else
  echo "Unknown OS, abort."
	exit 1
fi

# Install neovim
sudo snap install nvim --classic

# Remove vim if installed:
echo "Removing 'vim' from system"
sudo apt remove -y --purge vim vim-*

# Setup alias for nvim to vim:
echo "Adding an alias for nvim to vim"
echo 'alias vim="nvim"' >>~/.bashrc

# Test installation was successful:
nvim --help | echo "Successfully installed NeoVim"
