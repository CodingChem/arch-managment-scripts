#!/bin/bash
# Configure system clock
ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
hwclock --systohc
# uncommenting en_US.UTF-8
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
# keymap
echo "KEYMAP=no" >> /etc/vconsole.conf
# Host and Hostname
echo "nitro5" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 nitro5.localdomain nitro5" >> /etc/hosts
# setting root password to password
echo root:password | chpasswd

pacman -S grub efibootmgr networkmanager base-devel linux-headers bluez bluez-utils pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse bash-completion openssh reflector nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd


useradd -m vegard
echo ermanno:password | chpasswd
usermod -aG libvirt ermanno

echo "vegard ALL=(ALL) ALL" >> /etc/sudoers.d/vegard


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
