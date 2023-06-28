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
nnoremap <silent> <C-p> :Telescope find_files<CR>
nnoremap <silent> <C-f> :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
nnoremap <silent> <C-b> :Telescope buffers<CR>

" Resize vertical splits
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Navigate to next/previous buffer
map <leader>n :bn<CR>
map <leader>b :bp<CR>

" Close all buffers except this
map <leader>q :BufOnly<CR>

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
