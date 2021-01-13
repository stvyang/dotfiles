# Man, these are the "painkillers"
alias g="git"
alias t="tmux"
alias v="nvim"
alias vscode="code ."

# Remove all stored changes when your computer crashed
alias clear-vim="rm -r $HOME/.local/share/nvim/swap/"

# Smart mkdir that we should use
alias mkdir='mkdir -pv'

# This is how I "operates". I am machine?? Lul
alias dotfiles="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias gstart="cd $PERSONAL/getting-started"

# List used ports
alias ports='netstat -tulanp'

# Find running process
alias psg='ps aux | grep -i'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Reload ZSH configuration
alias reload='source ~/.zshrc'
