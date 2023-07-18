#!/bin/bash

# BASH
ln -sfn ~/.dotfiles/bash/bash_profile ~/.bash_profile

# NEOVIM
# mkdir -p ~/.config/nvim
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
# ln -sfn ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
# ln -sfn ~/.dotfiles/nvim/plugins ~/.config/nvim/



ln -sfn $HOME/.dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml

