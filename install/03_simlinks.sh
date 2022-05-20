#!/bin/bash

# Bash
ln -sfn ~/.dotfiles/bash/bashrc ~/.bashrc
ln -sfn ~/.dotfiles/bash/bash_profile ~/.bash_profile

# Vim
ln -sfn ~/.dotfiles/vim ~/.vim
ln -sfn ~/.vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/colors/* /home/ubuntu/opt/vim/share/vim/vim82/color

# Tmux
ln -sfn ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
