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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'svermeulen/vim-subversive'       " Add operators for substitutions
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'itchyny/vim-gitbranch'
" Plug 'tpope/vim-fugitive'
" Status line
Plug 'itchyny/lightline.vim'

Plug 'edluffy/hologram.nvim'



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

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
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
"inoremap <C-\> <C-o><plug>SlimeLineSend<C-w>wi<C-\><C-n><C-w>w<Down>
"nnoremap <C-\> <plug>SlimeLineSend<C-w>wi<C-\><C-n><C-w>w<Down>
"vnoremap <C-\> <plug>SlimeRegionSend<C-w>wi<C-\><C-n><C-w>wgv
inoremap <C-\> <C-o><plug>SlimeLineSend<Down>
nnoremap <C-\> <plug>SlimeLineSend<Down>
vnoremap <C-\> <plug>SlimeRegionSend


" Function: get the appropriate language for the current filetype {{{3
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



" Function: print the head of a pandas/R dataframe {{{3
function! PrintHead() abort
    " Get language of current filetype
    let language = GetLanguage()
    " Get the word under the cursor
    let current_word = expand("<cword>")
    " Send appropriate command to REPL
    if language == "r"
        :SlimeSend0 "head(" . current_word . ")\n"
    elseif language == "python"
        :SlimeSend0 current_word . ".head()\n"
    else
        :echo "Error: requires Python or R"
    endif
endfunction


" inoremap <C-CR> <C-o><plug>SlimeSendSlimeSend
" nnoremap <C-CR> <plug>SlimeSendSlimeSend
nmap <localleader>h :call PrintHead()<CR>


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



" --indent guide {{{1

" let g:indent_guides_enable_on_vim_startup = 1
lua require("ibl").setup()


" --telescope {{{1
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


lua require('telescope').load_extension('media_files')
lua require('telescope').setup {extensions={media_files={filetypes={"png", "jpg", "mp4", "webm", "pdf"}, find_cmd = "fd"}}}
" --gitsigns {{{1

lua require('gitsigns').setup()


" --hologram {{{1

lua require('hologram').setup{auto_display = false}

" --lightline {{{1


let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

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



" Use CTRL-<hjkl> to move between vim terminals
nnoremap <leader><Down> <C-w>j
nnoremap <leader><Up> <C-w>k
nnoremap <leader><Right> <C-w>l
nnoremap <leader><Left> <C-w>h

" Movement in insert mode
nnoremap <C-Down> <C-o>j
nnoremap <C-Up> <C-o>k
nnoremap <C-Right> <C-o>l
nnoremap <C-Left> <C-o>h

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



filetype plugin on
au BufNewFile,BufRead * if &ft == '' | set ft=bahs | endif



" 

