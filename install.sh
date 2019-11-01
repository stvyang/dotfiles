ROOT=$PWD
ln_flags="-sTf"

# Folders
echo "Creating folders if not exist"
mkdir -pv $HOME/notes
mkdir -pv $HOME/Code/Personal
mkdir -pv $HOME/Code/Personal/dotfiles
mkdir -pv $HOME/Code/Personal/scripts
mkdir -pv $HOME/Code/Workspace

# Zsh
echo "Creating symlinks for zsh configuration"
ln "$ln_flags" "$ROOT/zsh/config" "$HOME/.zsh"
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

# IdeaVim
echo "Creating symlinks for ideavim configuration"

ln "$ln_flags" "$ROOT/vim/ideavimrc" "$HOME/.ideavimrc"

# Notes
echo "Creating symlinks for dropbox"
DROPBOX_DIR=$HOME/Dropbox

ln "$ln_flags" "$DROPBOX_DIR/notes" "$HOME/notes"
