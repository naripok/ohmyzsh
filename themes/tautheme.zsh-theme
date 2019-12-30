# tau.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then

    ZSH_THEME_GIT_PROMPT_PREFIX=" ᚠ %{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=" %{$reset_color%}†"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

    RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚ "
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹ "
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖ "
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜ "
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═ "
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭ "

    PROMPT='[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[green]%}%~%{$reset_color%}$(git_prompt_info)]
$(vi_mode_prompt_info)'

else

    ZSH_THEME_GIT_PROMPT_PREFIX=" ᚠ "
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='$(vi_mode_prompt_info)${return_code}$(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚ "
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹ "
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖ "
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜ "
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═ "
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭ "

    PROMPT='[%n@%m:%~$(git_prompt_info)]
∴ '

fi
