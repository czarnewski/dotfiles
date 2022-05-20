

curl -o neovim_source.tar.gz
https://codeload.github.com/neovim/neovim/tar.gz/refs/tags/stable

untargz neovim_source.tar.gz
cd neovim-0.5.1

make CMAKE_INSTALL_PREFIX=~/opt/neovim

