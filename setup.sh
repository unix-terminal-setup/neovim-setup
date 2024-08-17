#!/usr/bin/env bash

# OS Dependencies
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux detected."
  sudo apt install -y cmake python3-venv
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt install -y nodejs
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

# Reload Path
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Linux detected."
  source ~/.bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Mac detected." 
  source ~/.bash_profile
else
  echo "Unknown OS, abort."
	exit 1
fi

# Run neovim
vim
