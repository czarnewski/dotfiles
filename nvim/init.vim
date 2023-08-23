" VIM CONFIGURATION FILE
" Paulo Czarnewski

" FUNCTIONS: {{{1

" GET FILE LANAGUAGE
function! GetLanguage()
    if &ft == "rmarkdown" || &ft == "rnoweb" || &ft == "r"
        let language = "r"
    elseif &ft == "python"
        let language = "python"
    else
        let language = "bash"
    endif
    return language
endfunction


" OPEN SUITABLE TERMINAL FOR FILETYPE
function! OpenTerminal() abort
  let starting_window = bufwinnr(bufname('%'))
  :execute ':vertical terminal ++close ++norestore ' . language
  :execute starting_window 'wincmd w'
  :SlimeConfig
endfunction


" CLOSE TERMINAL
function! CloseTerminal() abort
    let language = GetLanguage()
    if language == "r"
        :SlimeSend1 quit(save = "no")
    elseif language == "python"
        :SlimeSend1 exit()
    else
        :SlimeSend1 exit
    endif
endfunction


" LEADERS: {{{1
let maplocalleader=','
let mapleader=" "
nmap <leader>v :source $MYVIMRC <CR>


" PLUGINS: {{{1

source ~/.dotfiles/nvim/plugins/vimplug.vim

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime'
Plug 'preservim/nerdtree'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'svermeulen/vim-subversive'       " Add operators for substitutions

call plug#end()




" --nerdtree {{{1

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollasible='▽'

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : @% == '' ? ':NERDTree<cr>' : ':NERDTreeFind<cr>'
nmap <leader>N :NERDTreeFind


" --coc {{{1

let g:coc_global_extensions = [
      \ 'coc-r-lsp',
      \ 'coc-sh',
      \ 'coc-pyright',
      \ 'coc-vimlsp']
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" --slime {{{1

 
" let g:slime_paste_file = expand("$HOME/.slime_paste")


let g:slime_target = "neovim"
" let g:slime_neovim_config = { "term_finish": "close", "vertical": 4 }

" OPEN DIFFERENT VIM-TERMINALS:
nnoremap <localleader>r :vs <bar> term R<CR><C-w>wi<C-\><C-n><C-w>h
nnoremap <localleader>p :vs <bar> term python<CR><C-w>wi<C-\><C-n><C-w>h
nnoremap <localleader>t :vs <bar> term bash<CR><C-w>wi<C-\><C-n><C-w>h

" CLOSE THE RIGHT MOST TERMINAL
nnoremap <localleader>q <C-w>l :q<CR>

" SAVE WITH 'CRTL+S'
inoremap <C-s> <C-o>:w<CR>
nnoremap <C-s> :w<CR>

" RUN CODE WITH 'CTLR+ENTER'
" inoremap <C-CR> <C-o><plug>SlimeLineSend<Down>
" nnoremap <C-CR> <plug>SlimeLineSend<Down>
" vnoremap <C-CR> <plug>SlimeRegionSendgvo

" RUN CODE WITH 'CTLR+/' - IN TMUX
inoremap <C-\> <C-o><plug>SlimeLineSend<Down>
nnoremap <C-\> <plug>SlimeLineSend<C-w>wi<C-\><C-n><C-w>w<Down>
vnoremap <C-\> <plug>SlimeRegionSend<C-w>wi<C-\><C-n><C-w>wgv

" inoremap <C-CR> <C-o><plug>SlimeSendSlimeSend
" nnoremap <C-CR> <plug>SlimeSendSlimeSend
inoremap <C-h> <C-o>:call PrintHead()<CR>
nnoremap <C-h> :call PrintHead()<CR>


" EXIT TERMINAL WITH 'ESC'
tnoremap <Esc> <C-\><C-n>

" Also allow line-wise scrolling
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>




" --subversive {{{1

" Substitute motion with register content
nmap s <plug>(SubversiveSubstitute)

" Substitite motion within motion with user input
" Useful with e.g. `ie` motion, `inner entire buffer`
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)

nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" Do not move cursor after substituting
let g:subversivePreserveCursorPosition = 1





" COLORS: {{{1
colorscheme one
set background=dark




" BACKUP {{{1
set nobackup
set noswapfile
set nowb






" KEY MAPPINGS: {{{1


" Leave the text highlighted after indentation
vnoremap < <gv
vnoremap > >gv

" Use CTRL-<hjkl> to move between vim terminals
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l


" SETTINGS: {{{1

set foldmethod=marker
set scrolloff=5
set showcmd
syntax enable
set termguicolors
set number
set relativenumber
set cursorline

set colorcolumn=80

set showtabline=2


" 
set tabstop=2
set smarttab
set autoindent
set expandtab
set shiftwidth=2

set splitright
set clipboard=unnamedplus

set nocompatible
set mouse=ar

" 

