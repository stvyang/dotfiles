#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"               # HOST (?)
export COLOR_02="#fd5ff1"               # SYNTAX_STRING (Ex: git's ×, M & ??, commit id)
export COLOR_03="#87c38a"               # COMMAND_SUCCESS
export COLOR_04="#ffd7b1"               # COMMAND_SYMBOL (Ex: λ) & (Ex: git's modified: install.sh)
export COLOR_05="#84befa"               # CURRENT_PATH (Ex: ~/Code)
export COLOR_06="#b9b6fc"               # SYNTAX_VAR (?)
export COLOR_07="#85befd"               # (Ex: "2m 2s" beside "master")
export COLOR_08="#e0e0e0"               # (Ex: "master" beside CURRENT_PATH)

export COLOR_09="#7c7c7c"               # COMMENT (Ex: git #comment, # is comment in bash)
export COLOR_10="#fd5ff1"               # COMMAND_ERROR
export COLOR_11="#94fa36"               # EXECUTABLE_FILE (Ex: install.sh)
export COLOR_12="#f5ffa8"               # ?
export COLOR_13="#96cbfe"               # FOLDER (Ex: after ls -> Code folder)
export COLOR_14="#b9b6fc"               # (Ex: git's @ vim/config/colors.vim:1 @)
export COLOR_15="#85befd"               # ?
export COLOR_16="#e0e0e0"               # ?

export BACKGROUND_COLOR="#1D1F21"       # Background Color
export FOREGROUND_COLOR="#c5c8c6"       # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="atom-dark"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi

