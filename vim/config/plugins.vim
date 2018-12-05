" ==================================================
" Install plugins
" ==================================================
call plug#begin('~/.vim/plugged')

" --------------------------------------------------
" General
" --------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'         " Navigate between tmux panes on vim
Plug 'vim-airline/vim-airline'                " Beautiful status bar
Plug 'vim-airline/vim-airline-themes'         " Status bar themes
Plug 'scrooloose/nerdtree'                    " Display directory tree
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'                       " Fuzzy file finder
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'w0rp/ale'                               " Linter
Plug 'brooth/far.vim'                         " Find and replace
Plug 'vim-scripts/BufOnly.vim'                " Delete all buffers except
Plug 'Townk/vim-autoclose'                    " Autoclose [{()}]
Plug 'Chiel92/vim-autoformat'                 " Autoformat indent, spaces, etc
Plug 'JamshedVesuna/vim-markdown-preview'     " Preview markdown on browser
Plug 'danro/rename.vim'                       " Rename file of current buffer

" --------------------------------------------------
" Colorscheme 
" --------------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'jacoborus/tender.vim'

" --------------------------------------------------
" Javascript
" --------------------------------------------------
Plug 'pangloss/vim-javascript'                " Javascript syntax highlighting + indentation
Plug 'mxw/vim-jsx'                            " React JSX syntax highlighting + indentation
Plug 'elzr/vim-json'                          " JSON syntax highlighting + indentation

call plug#end()

" ==================================================
" Plugin Settings 
" ==================================================

colorscheme onedark

" --------------------------------------------------
" Airline 
" --------------------------------------------------
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1              " Show tabline
let g:airline#extensions#tabline#fnamemod = ':t'          " Buffer only shows file name instead of path

" --------------------------------------------------
" NERDTree
" --------------------------------------------------
let g:NERDSpaceDelims=1 

" --------------------------------------------------
" FZF
" --------------------------------------------------
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

" --------------------------------------------------
" Deoplete
" --------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1    " Enable relative path autocomplete

" --------------------------------------------------
" Ale
" --------------------------------------------------
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1              " Column for ale always shown beside line number

" Vim autoclose
" --------------------

" Fix autoclose, we need to press <ESC> twice when autocompletion pops out
" With this code we don't need to press <ESC> or 'ctrl + [' twice
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" --------------------------------------------------
" Vim markdown preview
" --------------------------------------------------
let vim_markdown_preview_hotkey='<C-m>'       " Hotkey to open markdown preview
