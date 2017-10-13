# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

if [ -f ~/.config/shell_profile ]; then
    . ~/.config/shell_profile
fi


# only bash specific commands here, general commands
# should be included in shell_profile file

# setxkbmap fr
