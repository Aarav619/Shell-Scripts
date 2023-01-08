#!/bin/bash

echo -e "\n======> Installing Yay\n"

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

echo -e "\n======> Installing AUR Packages...\n"

yay -Y --devel --noconfirm --combinedupgrade --batchinstall --nodiffmenu --save
yes | yay -S --noconfirm\
	nerd-fonts-jetbrains-mono \
	google-chrome \
	speedtest \
	bluetuith-bin \
	spotify \
	expo-cli \
	downgrade \
	ttf-icomoon-feather \
	jetbrains-toolbox \
	spotify-adblock \
	spicetify-cli \
	museeks-bin \
	sway-fx \
	ponymix \
	ttf-icomoon-feather \
	googlekeep-bin \
	notion-app \
	postman-bin \
	ttf-material-design-icons-git \
	visual-studio-code-bin \
	sway-audio-idle-inhibit-git \

echo -e "\n======> Completed Installing AUR Packages!\n"
