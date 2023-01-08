#!/bin/bash

if [ "$EUID" -eq 0 ]
then echo "Do not run as root"
    exit
fi

echo -e "\n======> Switching default shell to ZSH."
chsh -s /bin/zsh $USER
zsh

# Creating essential directories
mkdir -p ${HOME}/Pictures
mkdir -p ${HOME}/Pictures/Screenshots
mkdir -p ${HOME}/Others
mkdir -p ${HOME}/Drives
mkdir -p ${HOME}/Git
mkdir -p ${HOME}/Git/Github
mkdir -p ${HOME}/Git/Gitlab


# echo -e "\n======> Installing Paradise Theme."
# mkdir -p $HOME/.local/share/themes
# git clone https://gitlab.com/aaaravv/paradise-theme.git $HOME/.local/share/themes

echo -e "\n======> Installing Inter Nerd font"

mkdir -p $HOME/.local/share/fonts
git clone https://github.com/ayush-rathore/inter-nerd-font $HOME/.local/share/fonts/

echo -e "\n======> Installing ZSH-Plugins"
mkdir -p $HOME/.config/zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${HOME}/.config/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.config/zsh/plugins/
git clone https://github.com/wfxr/forgit.git ${HOME}/.config/zsh/plugins/
git clone https://github.com/Aloxaf/fzf-tab.git ${HOME}/.config/zsh/plugins/

mkdir -p ${HOME}/temp && cd ${HOME}/temp
git init
git remote add -f origin https://github.com/ohmyzsh/ohmyzsh.git
git sparse-checkout init
git sparse-checkout set "plugins/bgnotify" "plugins/sudo"
git pull origin master
cp -frv plugins/* ${HOME}/.config/zsh/plugins
rm -rf ${HOME}/temp

mkdir -p ${HOME}/Pictures
echo -e "\nGetting elegant wallpapers..."
git clone https://gitlab.com/aaaravv/Wallpapers.git $HOME/Pictures


echo -e "\nSway On Arch installed... Reboot system for changes to take effect!"
