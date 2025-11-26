# cd up multiple dir levels

cd_up() {
  builtin cd $(printf "%0.s../" $(seq 1 $1 ));
}

alias 'cd..'='cd_up'

# Fast directory switching!

home() {
  builtin cd "$HOME/$1"
}

work() {
  builtin cd "$WORK/$1"
}

personal() {
  builtin cd "$PERSONAL/$1"
}

# Display current directory on file explorer

file-explorer() {
  nautilus --browser $(pwd);
}

# Find and replace

agr() {
  ag -0 -l "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g'
}

# Change PHP version

php_use() {
  sudo update-alternatives --set php "/usr/bin/php$1"
  sudo update-alternatives --set php-config "/usr/bin/php-config$1"
  sudo update-alternatives --set phpize "/usr/bin/phpize$1"
}

#===================
# AI Code - Split current tmux window into nvim + opencode panes
#===================
ai-dev() {
  if [ -z "$TMUX" ]; then
    echo "Error: Not in a tmux session. Use 'tmuxinator start ai-dev' instead."
    return 1
  fi

  # First, start nvim in the current pane (left, will be 80%)
  tmux send-keys "nvim" C-m

  # Split window vertically creating right pane at 20% width
  tmux split-window -h -p 30 -c "#{pane_current_path}"

  # Now in the right pane (newly created), send opencode command
  tmux send-keys "opencode" C-m

  # Return focus to left pane (nvim)
  tmux select-pane -t 0
}
