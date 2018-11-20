ROOT=$PWD
ln_flags="-sTf"

# Zsh
echo "Creating symlinks for zsh configuration"
ln "$ln_flags" "$ROOT/zsh/config" "$HOME/.zsh"
ln "$ln_flags" "$ROOT/zsh/zshrc" "$HOME/.zshrc"

# Git
echo "Creating symlinks for git configuration"
ln "$ln_flags" "$ROOT/git/gitconfig" "$HOME/.gitconfig"

# Vim & Neovim
echo "Creating symlinks for vim & neovim configuration"
VIM_DIR=$HOME/.vim
NEOVIM_DIR=$HOME/.config/nvim

mkdir -p "$VIM_DIR"

ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
ln "$ln_flags" "$ROOT/vim/config" "$VIM_DIR/config"
ln "$ln_flags" "$ROOT/vim/vimrc" "$NEOVIM_DIR/init.vim"
ln "$ln_flags" "$ROOT/vim/vimrc" "$HOME/.vimrc"
