" ==================================================
" Install plugins
" ==================================================
call plug#begin('~/.vim/plugged')

" --------------------------------------------------
" General
" --------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'         " Navigate between tmux panes on vim
Plug 'itchyny/lightline.vim'                  " Beautiful status bar
Plug 'scrooloose/nerdtree'                    " Display directory tree
Plug 'scrooloose/nerdcommenter'               " Commenter
Plug 'mileszs/ack.vim'                        " Search tool
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                       " Fuzzy file finder
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'w0rp/ale'                               " Linter
Plug 'tpope/vim-surround'                     " Text surrounding manipulation
Plug 'brooth/far.vim'                         " Find and replace
Plug 'vim-scripts/BufOnly.vim'                " Delete all buffers except
Plug 'Townk/vim-autoclose'                    " Autoclose [{()}]
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Autoformat indent, spaces, etc
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

" --------------------------------------------------
" fzf
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
" deoplete.nvim
" --------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1    " Enable relative path autocomplete

" --------------------------------------------------
" ale
" --------------------------------------------------
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1              " Column for ale always shown beside line number

" --------------------------------------------------
" vim-autoclose
" --------------------------------------------------

" Fix autoclose, we need to press <ESC> twice when autocompletion pops out
" With this code we don't need to press <ESC> or 'ctrl + [' twice
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" --------------------------------------------------
" vim-prettier
" --------------------------------------------------
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#print_width = 120
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#config_precedence = 'file-override'

" --------------------------------------------------
" vim-markdown-preview
" --------------------------------------------------
let vim_markdown_preview_hotkey='<C-m>'       " Hotkey to open markdown preview

" --------------------------------------------------
" vim-javascript
" --------------------------------------------------
let g:javascript_plugin_jsdoc = 1             " Highlight JSDoc

" --------------------------------------------------
" vim-jsx
" --------------------------------------------------
let g:jsx_ext_required = 1                    " Only enable vim-jsx in .jsx file
