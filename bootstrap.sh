#!/usr/bin/env bash

# A bootstrap script to setup the .dotfiles folder.
# This file is licensed under the BSD Zero Clause License. 

read -n1 -p "Would you like to install the nvim config (will overwrite)? [Y/n]" instnvim
echo ""
case $instnvim in
    y|Y)
        rm -r -f ~/.config/nvim 
        ln -s $(pwd)/nvim ~/.config/nvim
        echo "Installed nvim config."
        ;;
    *) # Take everything else to be a no
        echo "Skipping nvim config..."
        ;;
esac

read -n1 -p "Would you like to install the tmux config (will overwrite)? [Y/n]" insttmux
echo ""
case $insttmux in
    y|Y)
        rm -r -f ~/.tmux.conf
        ln -s $(pwd)/.tmux.conf ~/.tmux.conf

        # Attempt to set the source file.
        if ! tmux source-file ~/.tmux.conf
        then
            echo "Failed to set tmux source file"
        fi

        echo "Installed tmux config."
        ;;
    *) # Take everything else to be a no
        echo "Skipping tmux config..."
        ;;
esac

read -n1 -p "Would you like to install the .bashrc config (will overwrite)? [Y/n]" instbashrc
echo ""
case $instbashrc in
    y|Y)
        rm -r -f ~/.bashrc
        ln -s $(pwd)/.bashrc ~/.bashrc
        echo "Installed .bashrc"
        ;;
    *)
        echo "Skipping .bashrc"
        ;;
esac

