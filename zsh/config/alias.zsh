# Man, these are the "painkillers"
alias g="git"
alias t="tmux"
alias v="nvim"

# Smart mkdir that we should use
alias mkdir='mkdir -pv'

# This is how I "operates". I am machine?? lul
alias opennotes="code $NOTES"
alias opendotfiles="nvim $DOTFILES"
alias openscripts="nvim $SCRIPTS"
alias todotfiles="cd $DOTFILES"
alias toscripts="cd $SCRIPTS"

# List used ports
alias ports='netstat -tulanp'

# Find running process
alias psg='ps aux | grep -i'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Reload ZSH configuration
alias reload='source ~/.zshrc'

# Shorthand
alias bcl="$HOME/.local/bin/bcl"
