

curl -o neovim_source.tar.gz
https://codeload.github.com/neovim/neovim/tar.gz/refs/tags/stable

alias targz='tar -czvf'
alias untargz='tar -xvzf'

untargz neovim_source.tar.gz
cd neovim-0.5.1

make CMAKE_INSTALL_PREFIX=~/opt/neovim
make install


cd..
rm -rf neovim-stable

mkdir -d ~/.config
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


