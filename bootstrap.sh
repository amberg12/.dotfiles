#!/usr/bin/env bash

# A bootstrap script to setup the .dotfiles folder.
# This file is licensed under the BSD Zero Clause License. 

read -n1 -p "Would you like to install the nvim config (will overwrite)? [Y/n]" instnvim
echo "\n"
case $instnvim in
    y|Y)
        echo "Deleting config...\n"
        rm -r -f ~/.config/nvim 
	ln -s $(pwd)/nvim ~/.config/nvim
        ;;
    *) # Take everything else to be a no
        echo "Skipping nvim config...\n"
        ;;
esac
