#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#282C34"               # HOST (?)
export COLOR_02="#E06C75"               # SYNTAX_STRING (Ex: git's ×, M & ??, commit id)
export COLOR_03="#98C379"               # COMMAND_SUCCESS
export COLOR_04="#E5C07B"               # COMMAND_SYMBOL (Ex: λ) & (Ex: git's modified: install.sh)
export COLOR_05="#61AFEF"               # CURRENT_PATH (Ex: ~/Code)
export COLOR_06="#C678DD"               # SYNTAX_VAR (?)
export COLOR_07="#56B6C2"               # (Ex: "2m 2s" beside "master")
export COLOR_08="#ABB2BF"               # (Ex: "master" beside CURRENT_PATH)

export COLOR_09="#5C6370"               # COMMENT (Ex: git #comment, # is comment in bash)
export COLOR_10="$COLOR_02"               # COMMAND_ERROR
export COLOR_11="$COLOR_03"               # EXECUTABLE_FILE (Ex: install.sh)
export COLOR_12="$COLOR_04"               # ?
export COLOR_13="$COLOR_05"               # FOLDER (Ex: after ls -> Code folder)
export COLOR_14="$COLOR_06"               # (Ex: git's @ vim/config/colors.vim:1 @)
export COLOR_15="$COLOR_07"               # ?
export COLOR_16="#FFFEFE"               # ?

export BACKGROUND_COLOR="$COLOR_01"       # Background Color
export FOREGROUND_COLOR="$COLOR_08"       # Text
export CURSOR_COLOR="$COLOR_09" # Cursor
export PROFILE_NAME="one-dark"
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

