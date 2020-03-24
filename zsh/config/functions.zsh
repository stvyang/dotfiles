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
  builtin cd "$WORKSPACE/$1"
}

pet() {
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

# Work
source $DOTFILES/.work/functions.zsh
