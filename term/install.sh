#!/bin/bash

ln -s ~/dotfiles/term/.tmux.conf ~/
ln -s ~/dotfiles/term/.tmux.conf.local ~/
ln -s ~/dotfiles/term/.zshrc ~/

ln -s ~/dotfiles/term/kitty ~/.config
ln -s ~/dotfiles/term/alacritty ~/.config
ln -s ~/dotfiles/term/wezterm ~/.config

# Softwares
sudo pacman -S --needed --noconfirm fzf starship
sudo pacman -S --needed --noconfirm sqlite3 ripgrep xclip zip unzip npm nodejs
sudo pacman -S --needed --noconfirm bottom duf exa dust procs

