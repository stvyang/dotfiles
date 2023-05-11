" ==================================================
" Install plugins
" ==================================================
call plug#begin('~/.vim/plugged')

" --------------------------------------------------
" General
" --------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'               " Navigate between tmux panes on vim
Plug 'itchyny/lightline.vim'                        " Beautiful status bar
Plug 'scrooloose/nerdtree'                          " Display directory tree
Plug 'scrooloose/nerdcommenter'                     " Commenter
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Git status flag on tree
Plug 'mileszs/ack.vim'                              " Search tool
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                             " Fuzzy file finder
Plug 'tpope/vim-surround'                           " Text surrounding manipulation
Plug 'vim-scripts/BufOnly.vim'                      " Delete all buffers except
Plug 'danro/rename.vim'                             " Rename file of current buffer
Plug 'tpope/vim-fugitive'                           " Git plugin
Plug 'wellle/context.vim'                           " Show context on current line of code
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Intellisense

" --------------------------------------------------
" Colorscheme
" --------------------------------------------------
Plug 'gosukiwi/vim-atom-dark'                 " A little bit high contrast but I like this overall

" Other colorscheme worth mentioning:
" - romainl/Apprentice                        " Low contrast
" - joshdick/onedark.vim                      " Playful colors
" - jacoborus/tender.vim                      " Stable choice

" --------------------------------------------------
" Markdown
" --------------------------------------------------
Plug 'godlygeek/tabular'                                                " Table support for markdown
Plug 'gabrielelana/vim-markdown'                                        " Markdown syntax highlighting
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }  " Preview markdown on browser

call plug#end()

" ==================================================
" Plugin Settings
" ==================================================
colorscheme atom-dark

" --------------------------------------------------
" lightline.vim
" --------------------------------------------------
let g:lightline = {
  \   'colorscheme': 'jellybeans',
  \ }
let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'readonly', 'filename', 'modified' ] ],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
  \ 'left': [ [ 'filename' ] ],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'percent' ] ] }
let g:lightline.tabline = {
  \ 'left': [ [ 'tabs' ] ],
  \ 'right': [ [ 'close' ] ] }

" --------------------------------------------------
" nerdtree
" --------------------------------------------------
let g:NERDSpaceDelims=1
let g:NERDTreeShowHidden=1

" --------------------------------------------------
" fzf
" --------------------------------------------------
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
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
" ale
" --------------------------------------------------
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1              " Column for ale always shown beside line number

" --------------------------------------------------
" vim-coc
" --------------------------------------------------
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-rust-analyzer',
  \ 'coc-go',
  \ 'coc-protobuf',
  \ 'coc-pyright'
\]

" --------------------------------------------------
" vim-markdown-preview
" --------------------------------------------------
let vim_markdown_preview_hotkey='<C-m>'       " Hotkey to open markdown preview

" --------------------------------------------------
" context.vim
" --------------------------------------------------
" Just add useless command just to not override H
let g:context_add_mappings=0
nnoremap <silent> <expr> zt  context#util#map_H()
