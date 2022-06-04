

curl -o neovim_source.tar.gz https://codeload.github.com/neovim/neovim/tar.gz/refs/tags/stable

alias targz='tar -czvf'
alias untargz='tar -xvzf'

tar -xvzf neovim_source.tar.gz
cd neovim-stable

./configure \
  --with-features=huge \
  --enable-cscope \
  --enable-largefile \
  --enable-python3interp=yes \
  --with-python3-config-dir="/bin/python3/lib" \
  --prefix="$HOME/opt/nvim/"

make
#make CMAKE_INSTALL_PREFIX=~/opt/neovim
make install


cd..
rm -rf neovim-stable

mkdir -d ~/.config
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
curl -fLo ~/.dotfiles/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -sLO install-node.vercel.app/lts


