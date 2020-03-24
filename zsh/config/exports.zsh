# nvm
export NVM_DIR="$HOME/.nvm"

# Register Arcanist's "arc" as a command in PATH
export PATH="$PATH:$HOME/arcanist/arcanist/bin"

# Github
export GITHUB_USERNAME="stvyang"
export GITHUB_EMAIL="stv.yang10@gmail.com"

# Shorthand
export NOTES="$HOME/notes"
export PERSONAL="$HOME/Code/Personal"
export WORKSPACE="$HOME/Code/Workspace"
export DOTFILES="$HOME/Code/Personal/dotfiles"
export SCRIPTS="$HOME/Code/Personal/scripts"

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# React Native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Vault
export PATH=$PATH:$HOME/vault

# Other
export EDITOR='nvim'

# Work
source $DOTFILES/.work/exports.zsh
