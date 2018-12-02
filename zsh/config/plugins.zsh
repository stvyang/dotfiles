# --------------------------------------------------
# USE ANTIGEN
# --------------------------------------------------
source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundle git

# Bundles lambda-pure theme
antigen bundle mafredri/zsh-async
antigen bundle marszall87/lambda-pure

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

