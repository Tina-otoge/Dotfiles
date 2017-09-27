if [ -f ~/.config/shell_profile ]; then
    . ~/.config/shell_profile
fi

# only zsh exclusive commands here, general commands
# should be included in shell_profile

PROMPT='%f[%F{cyan}Tina%F{gray}@%F{blue}%m%f] %# '
RPROMPT='%F{green}%~%f'

autoload -U compinit
compinit

setopt COMPLETE_IN_WORD

# keep background process at full speed
setopt NOBGNICE
# history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# colors
autoload -U colors
colors

. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# vim:ft=sh
