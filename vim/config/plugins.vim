" Load plugins
" ===========================================
call plug#begin('~/.vim/plugged')

" Basics
" ----------------------
Plug 'vim-airline/vim-airline'                " Beautiful status bars
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'                    " Display directory tree
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder 
Plug 'junegunn/fzf.vim'

" Colorschemes 
" ----------------------
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'connorholyday/vim-snazzy'
Plug 'jacoborus/tender.vim'

call plug#end()

" Plugin Settings 
" ===========================================

" Colorscheme
" ----------------------

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'medium'
" set background=dark

" colorscheme onedark

" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

colorscheme snazzy
let g:airline_theme = 'molokai'

" Airline 
" ----------------------
let g:airline#extensions#tabline#enabled = 1

" NERDTree
" ----------------------
let g:NERDSpaceDelims=1 

" FZF
" ----------------------
let $FZF_DEFAULT_COMMAND = 'ag -g ""'         " Remove gitignore files and dirs on fzf
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
  \ 'header':  ['fg', 'Comment'] }            " Customize fzf colors to match your color scheme

