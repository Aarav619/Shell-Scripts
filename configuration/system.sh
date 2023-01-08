#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
        exit
fi

# disable annoying beep
cp -fv /system-configs/blacklist.conf /etc/modprobe.d/

# running commands to configure the system
systemctl enable NetworkManager

# Bluetooth config & enable bluetooth
cp -fv /system-configs/main.conf /etc/bluetooth/
systemctl enable bluetooth

# vsftpd config
cp -fv /system-configs/vsftpd.conf /etc/

# Set time-date
timedatectl set-timezone 'Asia/Kolkata'
timedatectl set-ntp true

# Set systemd timeout -> 0
cp -fv /system-configs/loader.conf /boot/loader/

# Pacman config & mirrors
cp -fv /system-configs/pacman.conf /etc/
cp -fv /system-configs/mirrorlist /etc/pacman.d/

# Move binaries to /bin/
cp -fv /bin/autotiling /bin/

mkinitcpio -p linux

localectl set-locale LANG=en_US.UTF-8
