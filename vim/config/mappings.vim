" --------------------------------------------------
" General
" --------------------------------------------------

" leader is space
let mapleader=" "

" Move to beginning/end of line
noremap H ^
noremap L $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Insert one line below/above on normal mode
nnoremap <silent><leader>j o<Esc>
nnoremap <silent><leader>k O<Esc>

" Ctrl+c = copy | Ctrl+v = paste
" Only works in visual and insert mode to avoid conflict to visual-block key
" <C-v> in normal mode
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" Quit file
nnoremap <C-q> :q<CR>

" Toggle file tree
map <silent> <C-n> :NERDTreeToggle<CR>

" Navigate file tree for current buffer
map <leader>t :NERDTreeFind<cr>

" Find file
nnoremap <silent> <C-p> :FZF<CR>

" Resize vertical splits
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Navigate to next/previous buffer
map <leader>n :bn<CR>
map <leader>b :bp<CR>

" Close all buffers except this
map <leader>q :BufOnly<CR>

" Find keyword on all files
nnoremap <leader>f :Ag<space>

" Replace keyword
nnoremap <leader>r :%s/

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Reformat code (make code *pretty*)
nnoremap <leader>p :CocCommand prettier.formatFile<CR>

" Copy relative file path (based on cwd) of current buffer
nnoremap <F3> :let @+ = expand("%")<CR>

" Preview markdown file
nnoremap <leader>o :MarkdownPreview<CR>

" --------------------------------------------------
" coc.nvim
" --------------------------------------------------

" Make <CR> auto-select the first completion item and notify coc.nvim to 'Format on Enter'
"   because <cr> could be remapped by other vim plugin
" <CR> is Carriage Return -> possible of codes returned by the autocompletion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Code navigation (GoTo)
nmap <silent> gd :vsplit<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Choose an action
nnoremap <leader>a <Plug>(coc-codeaction)

" Code renaming
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Prettier` command to format using Prettier for current buffer.
command! -nargs=0 Prettier :CocCommand prettier.formatFile
