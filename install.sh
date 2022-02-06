#!/bin/bash
sudo pacman -S git
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $USER:$USER ./yay-git
cd yay-git
makepkg -si
yay -S xorg i3-gaps python-pywal firefox dunst rofi polybar-git picom
