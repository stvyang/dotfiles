ROOT=$PWD

kernel_name=$(uname -s)
echo "Kernel = $kernel_name"

unset ln_flags
if [[ $kernel_name == "Linux" ]]
then
  ln_flags="-sfT"
elif [[ $kernel_name == "Darwin" ]]
then
  ln_flags="-sfh"
else
  echo "Kernel $kernel_name is not supported"
fi

if [ ! -z "$ln_flags" ]
then
  # Folders
  echo "Creating folders if not exist"
  mkdir -p $HOME/code/personal
  mkdir -p $HOME/code/work

  # Zsh
  echo "Creating symlinks for zsh configuration"
  ZSH_DIR=$HOME/.zsh
  mkdir -p $ZSH_DIR
  ln "$ln_flags" "$ROOT/zsh/config" "$ZSH_DIR/config"
  ln "$ln_flags" "$ROOT/zsh/zshrc" "$HOME/.zshrc"

  # Git
  echo "Creating symlinks for git configuration"
  ln "$ln_flags" "$ROOT/git/gitconfig" "$HOME/.gitconfig"

  # Tmux
  echo "Creating symlinks for tmux configuration"
  TMUX_DIR=$HOME/.tmux
  mkdir -p $TMUX_DIR
  ln "$ln_flags" "$ROOT/tmux/config" "$TMUX_DIR/config"
  ln "$ln_flags" "$ROOT/tmux/tmux.conf" "$HOME/.tmux.conf"

  # Vim & Neovim
  echo "Creating symlinks for vim & neovim configuration"
  VIM_DIR=$HOME/.vim
  NEOVIM_DIR=$HOME/.config/nvim
  mkdir -p $VIM_DIR
  ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
  ln "$ln_flags" "$ROOT/vim/config" "$VIM_DIR/config"
  ln "$ln_flags" "$ROOT/vim/vimrc" "$NEOVIM_DIR/init.vim"
  ln "$ln_flags" "$ROOT/vim/vimrc" "$HOME/.vimrc"
  ln "$ln_flags" "$ROOT/vim/coc-settings.json" "$NEOVIM_DIR/coc-settings.json"

  # IdeaVim
  echo "Creating symlinks for ideavim configuration"
  ln "$ln_flags" "$ROOT/vim/ideavimrc" "$HOME/.ideavimrc"

  # Auth
  echo "Creating symlinks for auth configuration"
  ln "$ln_flags" "$ROOT/auth/netrc" "$HOME/.netrc"

  # Config
  echo "Creating symlinks for config configuration"
  mkdir -p $HOME/.config/alacritty
  ln "$ln_flags" "$ROOT/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
fi
