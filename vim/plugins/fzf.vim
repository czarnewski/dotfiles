

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

set nocompatible 
set showcmd

command! -bang -nargs=? -complete=dir Files 
  \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir':<q-args>, 'sink':'tabnew', 'source':'rg --files --hidden'}), <bang>0))

command! -bang -nargs=? -complete=dir AllFiles 
  \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir':<q-args>, 'sink':'tabnew', 'source':'rg --files --hidden --no-ignore'}), <bang>0))

nmap <leader>f :Files<cr>
nmap <leader>F :AllFiles<cr> 

let g:fzf_action = {
  \ '<cr>'  : 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

