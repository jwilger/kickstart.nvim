#!/usr/bin/env zsh

export DEBIAN_FRONTEND=noninteractive

sudo apt install -y \
  software-properties-common

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install -y neovim

mkdir -p ~/.config/nvim
ln -sf $DOTFILES_LOCATION/nvim/init.lua ~/.config/nvim/init.lua
ln -sf $DOTFILES_LOCATION/nvim/lua      ~/.config/nvim/lua       
