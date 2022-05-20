

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
        --with-python3-config-dir="$HOME/opt/python3/lib" \
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
    
    cd ~/opt/vim/share/vim/vim../colors
    wget\
https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim
    wget https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim
    wget
    https://raw.githubusercontent.com/sainnhe/everforest/master/colors/everforest.vim

    # Install Vim plugins using VimPlug
    vim +PlugInstall +qall
fi


