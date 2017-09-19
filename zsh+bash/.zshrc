if [ -f ~/.config/shell_profile ]; then
    . ~/.config/shell_profile
fi

# only zsh exclusive commands here, general commands
# should be included in shell_profile

PROMPT='%f[%F{cyan}Tina%F{gray}@%F{blue}%m%f] %# '
RPROMPT='%F{green}%~%f'

. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
