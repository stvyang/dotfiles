set termguicolors           " enable truecolor support
set hidden                  " preserve buffers (such as cut, copy, undo history) when switching files
set wildmenu                " enhanced command-line completion

" We don't need any backup atm. These settings only ensure vim.coc is working as expected
" How does these settings works? https://vi.stackexchange.com/questions/16843/what-does-nowritebackup-actually-do/16846
set nobackup
set nowritebackup

set updatetime=300          " having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set signcolumn=auto         " unlike what's recommended on vim.coc to display the signcolumn on initial file load, I prefer that it appears after the linting of LSP is activated

set number                  " show line numbers
set relativenumber          " show relative line numbers
set ruler                   " show line and column stats
set laststatus=2            " always show status line
set showcmd                 " show command on last line of screen
set showmode                " show mode on last line of screen

set tabstop=2               " number of visual spaces per tab
set softtabstop=2           " number of spaces per tab when pressing TAB
set shiftwidth=2            " number of spaces per tab when pressing >>, << or ==
set expandtab               " tabs are spaces

set cursorline              " highlight current line
set showmatch               " highlight matching [{()}]

set splitbelow              " vertical split pane to below
set splitright              " horizontal split pane to right

set hlsearch                " highlight matches search
set incsearch               " show where the search pattern matches as we typed
set ignorecase              " case insensitive search
set smartcase               " if search contains uppercase, it's case sensitive, otherwise, it's not

set autoindent              " use indent of current line when opening new line (o or O)

syntax enable               " enable syntax processing
filetype plugin indent on   " enable filetype plugins
