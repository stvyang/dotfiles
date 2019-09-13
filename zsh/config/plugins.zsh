# --------------------------------------------------
# USE ANTIGEN
# --------------------------------------------------
source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles lambda-pure theme
antigen bundle mafredri/zsh-async
antigen bundle stvyang/lambda-pure      # Temporary revert for commit https://github.com/marszall87/lambda-pure/commit/62323a6be3224f8bb57b3724d045ffda79ad277d

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

