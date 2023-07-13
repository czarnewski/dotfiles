
set nocompatible

" Movement: {{{1


" Use CTRL-<hjkl> to move between vim terminals
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>
tnoremap <C-h> <C-w><C-h>

" Open nvim R terminal
" tnoremap <localleader>t :vs | term
" tnoremap <localleader>q <C-w>q




" Learders: {{{1
let maplocalleader=','
let mapleader=" "
nmap <leader>v :source $MYVIMRC <CR>


" Plugins: {{{1

" VimPlug: {{{2
source ~/.dotfiles/nvim/plugins/vimplug.vim

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'



call plug#end()




" NerTree: {{{2
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollasible='▽'

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : @% == '' ? ':NERDTree<cr>' : ':NERDTreeFind<cr>'
nmap <leader>N :NERDTreeFind


" COC: {{{2

let g:coc_global_extensions = [
      \ 'coc-r-lsp',
      \ 'coc-vimlsp']
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes



inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Slime: {{{2

let g:slime_target = "neovim"
"let g:slime_default_config = {"term_finish": "close", "vertical": 1 }






" Colors: {{{1
colorscheme one
set background=dark




" Backup {{{1
set nobackup
set noswapfile
set nowb


" Folds and Tabs: {{{1




set foldmethod=marker

set scrolloff=5

set showcmd
syntax enable
set termguicolors

" 
set number
set relativenumber

set cursorline


set tabstop=2
set smarttab
set autoindent
set expandtab
set shiftwidth=2
set splitright
set clipboard=unnamed



" 

