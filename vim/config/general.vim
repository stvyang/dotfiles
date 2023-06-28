set termguicolors           " enable truecolor support
set hidden                  " preserve buffers (such as cut, copy, undo history) when switching files
set wildmenu                " enhanced command-line completion
set nofixendofline          " No <EOL>

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

" Tab config on specific file
autocmd Filetype js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype go setlocal tabstop=8 softtabstop=8 shiftwidth=8 expandtab

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
