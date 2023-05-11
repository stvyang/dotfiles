# --------------------
# HOMEBREW
# --------------------

# Custom - fzf
export PATH="/opt/homebrew/opt/fzf/bin:$PATH"

# Custom - Postgres
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"

# General
export PATH="/opt/homebrew/bin:$PATH"

# --------------------
# USER SPECIFIC
# --------------------

# Volta
export PATH="$VOLTA_HOME/bin:$PATH"

# Go
export PATH="$(go env GOBIN):$PATH"

# Rust
export PATH=$HOME/.cargo/bin:$PATH
