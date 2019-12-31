# BETTER VI MODE
# STARTS AS COMMAND MODE, SAME AS VIM, MAINTAINS MODE BETWEEN LINES, AWESOME MODE INDICATOR
# MAINTAINER: NARIPOK, https://github.com/naripok

IS_INIT=1
PREV_KEYMAP="main"

# set vi insert mode at startup
bindkey -v

# faster vi mode switching
export KEYTIMEOUT=1


function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select


function zle-line-finish() {
  PREV_KEYMAP=$VI_KEYMAP
}
zle -N zle-line-finish


function zle-line-init() {
  if [ $IS_INIT = 1 ]; then
    IS_INIT=0
    zle -K vicmd;
  fi

  if [ $PREV_KEYMAP = vicmd ]; then
    zle -K vicmd;
  fi

  zle zle-keymap-select
}
zle -N zle-line-init

# function vi-accept-line() {
#   VI_KEYMAP=vicmd
#   zle accept-line
# }
# zle -N vi-accept-line
# 
# # use custom accept-line widget to update $VI_KEYMAP
# bindkey -M vicmd '^J' vi-accept-line
# bindkey -M vicmd '^M' vi-accept-line

# if mode indicator wasn't setup by theme, define default
if [[ "$COMMAND_INDICATOR" == "" ]]; then
  COMMAND_INDICATOR="%{$fg_bold[red]%}|∴|%{$reset_color%}"
fi

if [[ "$INSERT_INDICATOR" == "" ]]; then
  INSERT_INDICATOR=" ∴ "
fi

function vi_mode_prompt_info() {
  echo "${${VI_KEYMAP/vicmd/$COMMAND_INDICATOR}/(main|viins)/$INSERT_INDICATOR}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
