

STARTDIR=$(pwd)
mkdir -p ~/opt

sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

sudo apt-get install libssl-dev openssl 


# Install Python 3 if `$HOME/opt/python3/` directory doesn't exist
if [ ! -d "$HOME/opt/python3/" ]; then

    # Download Python
    cd ~/opt
    PY_VERSION=3.9.8
    wget https://www.python.org/ftp/python/$PY_VERSION/Python-$PY_VERSION.tgz
    tar -zxvf Python-$PY_VERSION.tgz
    cd Python-$PY_VERSION

    # Configure and install Python
    ./configure \
    --enable-shared \
    --prefix="$HOME/opt/python3/" \
    --with-ensurepip=install
    make -j 
    make install -j

    # Verify Python installation
    
    cd ..
    rm -rf Python-$PY_VERSION Python-$PY_VERSION.tgz
    ~/opt/python3/bin/python3 --version
    if [ $? != 0 ]; then
        echo "Error: Python installation failed"
        exit 1
    fi
fi

