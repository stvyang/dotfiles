# General
export EDITOR='nvim'

# Github
export GITHUB_USERNAME="stvyang"
export GITHUB_EMAIL="stv.yang10@gmail.com"

# Shorthand
export PERSONAL="$HOME/code/personal"
export WORK="$HOME/code/work"
export DOTFILES="$HOME/code/personal/dotfiles"
export HAYAI="$HOME/code/personal/hayai"
export INSUTORU="$HOME/code/personal/insutoru"

# Volta
export VOLTA_HOME="$HOME/.volta"

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# Fzf
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-t:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
