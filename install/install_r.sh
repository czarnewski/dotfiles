
STARTDIR=$(pwd)
mkdir -p ~/opt


# Install Python 3 if `$HOME/opt/python3/` directory doesn't exist
if [ ! -d "$HOME/opt/python3/" ]; then

    # Download Python
    cd ~/opt
    R_VERSION=4.1.2
    R_MAIN=$(echo $RVERSION) | sed 's/\..*//'
    wget https://cran.r-project.org/src/base/R-$R_MAIN/$R_VERSION.tar.gztar -zxvf
    R-$R_VERSION.tgz
    cd R-$R_VERSION

    # Configure and install R
    ./configure\
    --prefix=$HOME/opt/R\
    '--with-cairo'\
    '--with-jpeglib'\
    '--with-readline'\
    '--with-tcltk'\
    '--with-blas'\
    '--with-lapack'\
    '--enable-R-profiling'\
    '--enable-R-shlib'
    '--enable-memory-profiling'
    
    make -j 
    make install -j
fi

