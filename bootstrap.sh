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

read -n1 -p "Would you like to install the starship config (will overwrite)? [Y/n]" instarship
echo ""
case $instarship in
    y|Y)
        rm -r -f ~/.config/starship.toml
        ln -s $(pwd)/starship.toml ~/.config/starship.toml
        echo "Installed starship config"
        ;;
    *)
        echo "Skipping starship config"
        ;;
esac

read -n1 -p "Would you like to install the alacritty config (will overwrite)? [Y/n]" instala
echo ""
case $instala in
    y|Y)
        # Dependency
        git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
        rm -r -f ~/.alacritty.toml
        ln -s $(pwd)/.alacritty.toml ~/.alacritty.toml
        echo "Installed alacritty config"
        ;;
    *)
        echo "Skipping alacritty config"
        ;;
esac

read -n1 -p "Would you like to install the i3 config (will overwrite)? [Y/n]" insti3
echo ""
case $insti3 in
    y|Y)
        rm -r -f ~/.config/i3/config
        ln -s $(pwd)/.config/i3/config ~/.config/i3/config
        echo "Installed i3 config"
        ;;
    *)
        echo "Skipping i3 config"
        ;;
esac

