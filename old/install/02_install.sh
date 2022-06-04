#!/bin/bash



# Script for installing Python 3, Vim, Conda and Nextflow into `$HOME/opt/` for
# increased portability as well as solving problems with Python libraries for
# some Vim plugins (e.g. YouCompleteMe and UltiSnips) on the Uppmax cluster

#sudo apt-get install libncurses-dev
#sudo apt-get install libffi-dev
#sudo apt-get install gfortran

# Get the current system
if [ $(uname) == "Darwin" ]; then
  SYS="MacOSX"
elif [ $(uname) == "Linux" ]; then
  SYS="Linux"
fi

# Get the current archtecture
if [ $(arch) == "i386" ]; then
  ARCH="x86_64"
elif [ $(arch) == "aarch64" ]; then
  ARCH="aarch64"
  wget https://github.com/conda-forge/miniforge/releases/download/4.12.0-0/Miniforge3-$SYS-$ARCH.sh
fi





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


e/configure --prefix=$HOME/opt/R '--with-cairo' '--with-jpeglib' '--with-readline' '--with-tcltk' '--with-blas' '--with-lapack' '--enable-R-profiling' '--enable-R-shlib' '--enable-memory-profiling'
make install -j


curl -o Miniconda3-latest-MacOSX-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh



sudo apt install cmake -y
curl https://codeload.github.com/thewtex/tmux-mem-cpu-load/tar.gz/refs/tags/v3.5.1 > ~/opt/tmux-mem-cpu-load_3.5.1.tar.gz
untargz ~/opt/tmux-mem-cpu-load_3.5.1.tar.g
cd ~/opt/tmux-mem-cpu-load_3.5.1.tar.g
cmake -DCMAKE_INSTALL_PREFIX:PATH=~/opt/tmux/tmux-mem-cpu-load-3.5.1 .
make -j
make install -j



wget https://cran.r-project.org/src/base/R-4/R-4.1.2.tar.gz
gunzip R-4.1.2.tar.gz
ll
tar R
tar -h
ll
rm R-4.1.2.tar
gunzip R-4.1.2.tar.gz
wget https://cran.r-project.org/src/base/R-4/R-4.1.2.tar.gz
wget https://www.python.org/ftp/python/3.9.8/Python-3.9.8.tgz
ll
tmux ls
tmux -a 0
tmux attach -t 0
ll
source ~/.bash_profile
untargz R-4.1.2.tar.gz
ll
cd R-4.1.2/


sudo apt install build-essential
sudo apt-get install gfortran
./configure
sudo apt-get install libreadline-dev
sudo apt-get install build-essential fort77 xorg-dev liblzma-dev libblas-dev gfortran gcc-mu
ltilib gobjc++ aptitude libreadline-dev libbz2-dev libpcre2-dev libcurl4 libcurl4-openssl-dev default-jre default-jdk openjdk-8-jdk openjdk-8-jre -y
./configure
./configure --help
./configure --with-x=no --prefix="$HOME/opt/vim"
make -j
sudo apt-get install libbz2-dev
sudo apt-get install libX11-dev
sudo apt-get install xorg-x11-server-dev
sudo apt-get install libXt-dev
sudo apt-get install xorg-dev
./configure --prefix=/opt/R '--with-cairo' '--with-jpeglib' '--with-readline' '--with-tcltk'
 '--with-blas' '--with-lapack' '--enable-R-profiling' '--enable-R-shlib' '--enable-memory-profiling'
sudo apt-get install liblzma
sudo apt-get install lzma
sudo apt-get install liblzma-dev
./configure --prefix=/opt/R '--with-cairo' '--with-jpeglib' '--with-readline' '--with-tcltk'
 '--with-blas' '--with-lapack' '--enable-R-profiling' '--enable-R-shlib' '--enable-memory-profiling'
sudo apt-get install build-essential fort77 xorg-dev liblzma-dev libblas-dev gfortran gcc-multilib gobjc++ aptitude libreadline-dev libbz2-dev libpcre2-dev libcurl4 libcurl4-openssl-dev default-jre default-jdk openjdk-8-jdk openjdk-8-jre -y
sudo apt-get install build-essential fort77 xorg-dev liblzma-dev libblas-dev gfortran gobjc++ aptitude libreadline-dev libbz2-dev libpcre2-dev libcurl4 libcurl4-openssl-dev default-jre default-jdk openjdk-8-jdk openjdk-8-jre -y
./configure --prefix=/opt/R '--with-cairo' '--with-jpeglib' '--with-readline' '--with-tcltk' '--with-blas' '--with-lapack' '--enable-R-profiling' '--enable-R-shlib' '--enable-memory-profiling'
sudo apt-get install texlive texlive-fonts-extra texinfo



