ROOT=$PWD
ln_flags="-sTf"

# Folders
echo "Creating folders if not exist"
mkdir -pv $HOME/code/personal
mkdir -pv $HOME/code/workspace

# Zsh
echo "Creating symlinks for zsh configuration"
ln "$ln_flags" "$ROOT/zsh/config" "$HOME/.zsh/config"
ln "$ln_flags" "$ROOT/zsh/zshrc" "$HOME/.zshrc"

# Git
echo "Creating symlinks for git configuration"
ln "$ln_flags" "$ROOT/git/gitconfig" "$HOME/.gitconfig"

# Tmux
echo "Creating symlinks for tmux configuration"
TMUX_DIR=$HOME/.tmux

mkdir -p "$TMUX_DIR"

ln "$ln_flags" "$ROOT/tmux/config" "$TMUX_DIR/config"
ln "$ln_flags" "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

# Vim & Neovim
echo "Creating symlinks for vim & neovim configuration"
VIM_DIR=$HOME/.vim
NEOVIM_DIR=$HOME/.config/nvim

mkdir -p "$VIM_DIR"

ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
ln "$ln_flags" "$ROOT/vim/config" "$VIM_DIR/config"
ln "$ln_flags" "$ROOT/vim/vimrc" "$NEOVIM_DIR/init.vim"
ln "$ln_flags" "$ROOT/vim/vimrc" "$HOME/.vimrc"
ln "$ln_flags" "$ROOT/vim/coc-settings.json" "$NEOVIM_DIR/coc-settings.json"

# IdeaVim
echo "Creating symlinks for ideavim configuration"

ln "$ln_flags" "$ROOT/vim/ideavimrc" "$HOME/.ideavimrc"
