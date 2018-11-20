# Loads lambda-pure
autoload -Uz promptinit
promptinit
# PURE_NODE_ENABLED=0
# PURE_GIT_UP_ARROW='↑'
# PURE_GIT_DOWN_ARROW='↓'
prompt lambda-pure

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && emulate sh -c 'source "$NVM_DIR/nvm.sh"'

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && emulate sh -c 'source "$NVM_DIR/bash_completion"'
