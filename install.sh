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

  # Neovim
  echo "Creating symlinks for neovim configuration"
  NEOVIM_DIR=$HOME/.config/nvim
  mkdir -p $NEOVIM_DIR/lua/config
  for file in $ROOT/lazyvim/lua/config/*; do
    ln "$ln_flags" "$file" $NEOVIM_DIR/lua/config/
  done
  mkdir -p $NEOVIM_DIR/lua/plugins
  for file in $ROOT/lazyvim/lua/plugins/*; do
    ln "$ln_flags" "$file" $NEOVIM_DIR/lua/plugins/
  done
  ln "$ln_flags" "$ROOT/lazyvim/init.lua" "$NEOVIM_DIR/init.lua"

  # IdeaVim
  echo "Creating symlinks for ideavim configuration"
  ln "$ln_flags" "$ROOT/vim/ideavimrc" "$HOME/.ideavimrc"

  # Auth
  echo "Creating symlinks for auth configuration"
  ln "$ln_flags" "$ROOT/auth/netrc" "$HOME/.netrc"

  # Alacritty
  echo "Creating symlinks for alacritty configuration"
  mkdir -p $HOME/.config/alacritty
  ln "$ln_flags" "$ROOT/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

  # Tmuxinator
  echo "Creating symlinks for tmuxinator configuration"
  mkdir -p $HOME/.config/tmuxinator
  ln "$ln_flags" "$ROOT/config/tmuxinator/personal-dev.yml" "$HOME/.config/tmuxinator/personal-dev.yml"
  ln "$ln_flags" "$ROOT/config/tmuxinator/pintu-dev.yml" "$HOME/.config/tmuxinator/pintu-dev.yml"
fi
