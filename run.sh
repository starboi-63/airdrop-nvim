#!/bin/bash

echo "=== AIRDROP NVIM ==="

sudo apt-get update && sudo apt-get upgrade -y

echo "=== INSTALLING PREREQS ==="
sudo apt-get install ninja-build gettext cmake curl build-essential unzip ripgrep golang -y

echo "=== INSTALLING NEOVIM ==="
cd
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# git clone https://github.com/neovim/neovim.git && cd neovim
# make CMAKE_BUILD_TYPE=Release
# sudo make install

echo "=== INSTALLING CLANGD ==="
cp -r ~/airdrop-nvim/clangd/mason* ~/.local/share/nvim/mason/packages/
wget -O ~/.local/share/nvim/mason/packages/clangd/clangd_19.1.2.zip https://github.com/clangd/clangd/releases/download/19.1.2/clangd-linux-19.1.2.zip
unzip ~/.local/share/nvim/mason/packages/clangd/clangd_19.1.2.zip && rm ~/.local/share/nvim/mason/packages/clangd/clangd_19.1.2.zip

echo "=== INSTALLING NEOVIM CONFIG ==="
mkdir ~/.config && cd ~/.config
git clone https://github.com/kberdos/nvim.git && cd nvim
git switch container

cd
exec bash
