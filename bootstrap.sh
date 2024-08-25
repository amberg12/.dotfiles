#!/usr/bin/env bash

# A bootstrap script to setup the .dotfiles folder.
# This file is licensed under the BSD Zero Clause License. 

rm -r -f ~/.config/nvim 
ln -s $(pwd)/nvim ~/.config/nvim

rm -r -f ~/.tmux.conf
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

if ! tmux source-file ~/.tmux.conf
then
    echo "Failed to set tmux source file"
fi


rm -r -f ~/.bashrc
ln -s $(pwd)/.bashrc ~/.bashrc

rm -r -f ~/.config/starship.toml
ln -s $(pwd)/starship.toml ~/.config/starship.toml

git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
rm -r -f ~/.alacritty.toml
ln -s $(pwd)/.alacritty.toml ~/.alacritty.toml

rm -r -f ~/.config/i3/config
ln -s $(pwd)/.config/i3/config ~/.config/i3/config
