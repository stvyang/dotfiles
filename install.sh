ln_flags="-sf"

# Git
ln "$ln_flags" "$PWD/git/gitconfig" "$HOME/.gitconfig"

# Vim & Neovim
NEOVIM_DIR=$HOME/.config/nvim
VIM_DIR=$HOME/.vim

mkdir -p "$NEOVIM_DIR"
mkdir -p "$VIM_DIR"

ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
ln "$ln_flags" "$PWD/vim/config" "$VIM_DIR/config"
ln "$ln_flags" "$PWD/vim/vimrc" "$NEOVIM_DIR/init.vim"
ln "$ln_flags" "$PWD/vim/vimrc" "$HOME/.vimrc"
