" leader is comma
let mapleader=";"

" Move to beginning/end of line
noremap H ^
noremap L $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Insert new line below/above without insert mode
" Used for paste yanked words
nnoremap <silent><C-j> o<Esc>
nnoremap <silent><C-k> O<Esc>

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

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Toggle NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Toggle Commenter
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" Find file
nnoremap <silent> <C-p> :FZF<CR>

