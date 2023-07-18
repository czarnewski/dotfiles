#!/bin/bash

# BASH
ln -sfn $HOME/.dotfiles/bash/bash_profile $HOME/.bash_profile

# NEOVIM
mkdir -p $HOME/.config/nvim
ln -sfn $HOME/.dotfiles/nvim $HOME/.config/nvim
alias nvim='~/opt/nvim'


# TMUX
ln -sfn $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf



ln -sfn $HOME/.dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml

