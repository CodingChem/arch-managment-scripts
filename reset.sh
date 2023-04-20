#!/bin/bash

# become su
#sudo su -
# Mark all packages as dependancies
sudo pacman -D --asdeps $(pacman -Qqe)

sudo pacman -D --asexplicit base base-devel linux linux-firmware git vim 

# for intel
sudo pacman -D --asexplicit intel-ucode

# for nvidia
sudo pacman -D --asexplicit nvidia nvidia-utils nvidia-settings

# for wireless
sudo pacman -D --asexplicit networkmanager

sudo pacman -Qttdq | sudo pacman -Rns -
# end root
#exit
