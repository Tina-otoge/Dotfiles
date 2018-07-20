#!/usr/bin/env sh
alias sh='bash --init-file ~/.config/shell_profile'
lock() {
    sh ~/.config/i3/lockcam.sh
}
setxkbmap() {
    lock
}
unalias emacs
unalias ne
unalias vim
emacs() {
    lock
}
ne() {
    lock
}
vim() {
    lock
}
cat() {
    lock
}
nano() {
    lock
}
chmod() {
    lock
}
xrandr() {
    lock
}
curl() {
    lock
}


# vim:ft=sh
