if [ -f ~/.config/shell_profile ]; then
    . ~/.config/shell_profile
fi

# only zsh exclusive commands here, general commands
# should be included in shell_profile

if [ -f ~/repos/zsh-git-prompt/zshrc.sh ]; then
    . ~/repos/zsh-git-prompt/zshrc.sh
    PROMPT='%f[%F{cyan}%n%F{gray}@%F{blue}%m%f]$(git_super_status) %F{red}%#%f '
else
    PROMPT='%f[%F{cyan}%n%F{gray}@%F{blue}%m%f] %F{red}%#%f '
fi

## Debian-like prompt
## Fish-like prompt
# PROMPT='%F{cyan}%n%F{gray}@%F{blue}%m%F{red}%#%F{green}>>> %f'
RPROMPT='%F{green}%~%f'

autoload -U compinit
compinit
# colors
autoload -U colors
colors



# in word completion
setopt complete_in_word

# keep background process at full speed
setopt no_bg_nice

# history
HISTFILE=~/.zhistory
HISTSIZE=90000
SAVEHIST=9000
#setopt append_history
#setopt inc_append_history
#setopt share_history

# can omit cd
setopt auto_cd

. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
# vim:ft=sh
