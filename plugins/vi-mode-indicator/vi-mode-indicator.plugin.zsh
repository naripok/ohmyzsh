# Updates editor information when the keymap changes.
if [[ "$VI_KEYMAP" == "" ]]; then
    VI_KEYMAP=main
fi

function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi-accept-line() {
  VI_KEYMAP=main
  zle accept-line
}

zle -N vi-accept-line

# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' vi-accept-line
bindkey -M vicmd '^M' vi-accept-line

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
