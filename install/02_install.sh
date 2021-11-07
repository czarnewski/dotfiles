#!/bin/bash

# Script for installing Python 3, Vim, Conda and Nextflow into `$HOME/opt/` for
# increased portability as well as solving problems with Python libraries for
# some Vim plugins (e.g. YouCompleteMe and UltiSnips) on the Uppmax cluster

#sudo apt-get install libncurses-dev
#sudo apt-get install libffi-dev


# Directories used in installations
STARTDIR=$(pwd)
mkdir -p ~/opt

# Install Vim if `$HOME/opt/vim/` directory doesn't exist
if [ ! -d "$HOME/opt/vim/" ]; then

    # Download Vim
    cd ~/opt
    git clone --depth 1 https://github.com/vim/vim.git vim-source
    cd vim-source

    # Configure and install Vim
    ./configure \
        --with-features=huge \
        --enable-cscope \
        --enable-largefile \
        --enable-python3interp=yes \
        --with-python3-config-dir="/bin/python3/lib" \
        --prefix="$HOME/opt/vim/"
    make
    make install
    cd ..
    rm -rf vim-source

    # Verify Vim installation
    ~/opt/vim/bin/vim --version
    if [ $? != 0 ]; then
        echo "Error: Vim installation failed"
        exit 1
    fi

    # Install Vim plugins using VimPlug
    vim +PlugInstall +qall
fi

