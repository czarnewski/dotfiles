

STARTDIR=$(pwd)
mkdir -p ~/opt


# Install Python 3 if `$HOME/opt/python3/` directory doesn't exist
if [ ! -d "$HOME/opt/python3/" ]; then

    # Download Python
    git clone https://github.com/tmux/tmux.git tmux-source
    cd tmux-source

    sh autogen.sh
    ./configure --prefix="$HOME/opt/tmux/"

    make -j $ncores 
    make install -j $ncores

    cd ..
    rm -rf tmux-source
    
fi

