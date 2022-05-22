#!/bin/bash

# Bash
ln -sfn ~/.dotfiles/bash/bashrc ~/.bashrc
ln -sfn ~/.dotfiles/bash/bash_profile ~/.bash_profile

# Vim
ln -sfn ~/.dotfiles/vim ~/.vim
ln -sfn ~/.vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/colors/* /home/ubuntu/opt/vim/share/vim/vim82/color

# Neovim
mkdir -d ~/.config/nvim/init.vim
ln -sfn ~/.dotfiles/neovim/init.vim ~/.config/nvim/init.vim

# Tmux
ln -sfn ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
