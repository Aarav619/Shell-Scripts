#!/bin/bash

echo "======> Copying config files to respective dir..."
echo

# Copying config files to ~/.config/ dir
mkdir -p ${HOME}/.config
cp -frv ../.config/* ${HOME}/.config/
cp -frv ../.zshenv ${HOME}/
echo -e "\n======> Done Patching configs..."
