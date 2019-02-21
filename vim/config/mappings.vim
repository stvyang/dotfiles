" leader is space
let mapleader=" "

" Move to beginning/end of line
noremap H ^
noremap L $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Insert new line below/above without insert mode
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

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Toggle NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Navigate NERDTree for current buffer
map <leader>t :NERDTreeFind<cr>

" Toggle Commenter
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" Find file
nnoremap <silent> <C-p> :FZF<CR>

nnoremap <silent> <leader>p :PrettierAsync<CR>

" Resize vertical splits
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Navigate to next/previous buffer
map <leader>n :bn<CR>
map <leader>b :bp<CR>

" Delete current/all-except buffers
map <leader>w :bd<CR>
map <leader>q :BufOnly<CR>

" Copy relative filepath (based on cwd) of current buffer
nnoremap <F3> :let @+ = expand("%")<CR>

" Search keyword on cursor using Ack
nnoremap <leader>a :Ack!<space>

" Preview markdown file
nnoremap <leader>o :InstantMarkdownPreview<CR>

" Replace text
nnoremap <leader>r :%s/
