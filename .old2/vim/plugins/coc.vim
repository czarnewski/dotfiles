
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-typos',
      \ 'coc-explorer',
      \ 'coc-diagnostic',
      \ 'coc-git',
      \ 'coc-markdown-preview-enhanced',
      \ 'coc-svg',
      \ 'coc-webview',
      \ 'coc-sh',
      \ 'coc-r-lsp',
      \ 'coc-vimlsp',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-html',
      \ 'coc-snippets',
      \ 'coc-json',
      \ 'coc-jedi']


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

