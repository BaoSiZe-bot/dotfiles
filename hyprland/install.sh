#!/bin/bash

# archlinuxcn and yay
sudo pacman-key --lsign-key "farseerfc@archlinux.org"
sudo pacman -S --needed --noconfirm archlinuxcn-keyring
sudo pacman -S --needed --noconfirm yay

# Setup configs
ln -s ~/dotfiles/hyprland/hypr ~/.config
ln -s ~/dotfiles/hyprland/mako ~/.config
ln -s ~/dotfiles/hyprland/rofi ~/.config
ln -s ~/dotfiles/hyprland/waybar ~/.config

# Basic softwares
sudo pacman -S --needed --noconfirm hyprland hyprpaper hyprlock waybar mako
sudo pacman -S --needed --noconfirm xorg-xwayland

# Terminal
sudo pacman -S --needed --noconfirm kitty tmux

# Network Manager
sudo pacman -S --needed --noconfirm nm-connection-editor

# Fonts
sudo pacman -S --needed --noconfirm ttf-sourcecodepro-nerd adobe-source-han-serif-cn-fonts wqy-zenhei
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

# Audio
sudo pacman -S --needed --noconfirm sof-firmware alsa-firmware alsa-ucm-conf pavucontrol

# Chinese input method
sudo pacman -S --needed --noconfirm fcitx5-im
sudo pacman -S --needed --noconfirm fcitx5-rime rime-ice-git
sudo pacman -S --needed --noconfirm fcitx5-material-color

# Install Intel GPU driver (for others, please refer to offical document):
sudo pacman -S --needed --noconfirm mesa lib32-mesa vulkan-intel lib32-vulkan-intel

# Screenshot
sudo pacman -S --needed --noconfirm grim slurp swappy
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland

# Clipboard history
sudo pacman -S --needed --noconfirm wl-clipboard cliphist

# GTK theme
sudo pacman -S --needed --noconfirm lxappearance
sudo pacman -S --needed --noconfirm materia-gtk-theme papirus-icon-theme

# QT theme
sudo pacman -S --needed --noconfirm qt5ct qt5-wayland

# File Manager
sudo pacman -S --needed --noconfirm thunar

# Picture Viewer
sudo pacman -S --needed --noconfirm ristretto

# Mail and Calendar
sudo pacman -S --needed --noconfirm thunderbird

# SDDM
sudo pacman -S --needed --noconfirm sddm
sudo systemctl enable sddm
