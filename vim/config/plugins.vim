" Load plugins
" ===========================================
call plug#begin('~/.vim/plugged')

" Basics
" ----------------------
Plug 'vim-airline/vim-airline'                " Beautiful status bars
Plug 'scrooloose/nerdtree'                    " Display directory tree
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder 
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Colorschemes 
" ----------------------
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'

call plug#end()

" Plugin Settings 
" ===========================================

" Colorscheme
" ----------------------
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
set background=dark

" NERDTree
" ----------------------
let g:NERDTreeMapOpenSplit='h'                " Allow i to UP key like mappings

" FZF
" ----------------------

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

