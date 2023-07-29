#!/bin/bash

# BASH
ln -sfn $HOME/.dotfiles/bash/bash_profile $HOME/.bash_profile

# NEOVIM
mkdir -p $HOME/.config/nvim
ln -sfn $HOME/.dotfiles/nvim/ $HOME/.config/nvim
# alias nvim='~/opt/nvim'

# TMUX
mkdir -p $HOME/.config/tmux
ln -sfn $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# ALACRITTY
mkdir -p $HOME/.config/alacritty
ln -sfn $HOME/.dotfiles/alacritty/ $HOME/.config/alacritty

# KITTY
mkdir -p $HOME/.config/kitty
ln -sfn $HOME/.dotfiles/kitty/ $HOME/.config/kitty


