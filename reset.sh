#!/bin/bash

# become su
sudo su
# Mark all packages as dependancies
pacman -D --asdeps $(pacman -Qqe)

pacman -D --asexplicit base base-devel linux linux-firmware git vim 

# for intel
pacman -D --asexplicit intel-ucode

# for nvidia
pacman -D --asexplicit nvidia nvidia-utils nvidia-settings

# for wireless
pacman -D --asexplicit networkmanager

pacman -Qttdq | pacman -Rns -
# end root
#exit
