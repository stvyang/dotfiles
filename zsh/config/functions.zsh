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
