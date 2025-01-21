#!/bin/bash

echo "=== AIRDROP NVIM ==="

sudo apt-get update && sudo apt-get upgrade -y

echo "=== INSTALLING PREREQS ==="
sudo apt-get install ninja-build gettext cmake build-essential curl unzip ripgrep clangd golang -y

echo "=== BUILDING NEOVIM ==="
cd
git clone https://github.com/neovim/neovim.git && cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# NOTE: pre-built neovim has treesitter issues...

# cd
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# sudo rm -rf /opt/nvim
# sudo tar -C /opt -xzf nvim-linux64.tar.gz
# echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

echo "=== INSTALLING NEOVIM CONFIG ==="
mkdir ~/.config && cd ~/.config
git clone https://github.com/kberdos/nvim.git && cd nvim
git switch container

cd
exec bash
