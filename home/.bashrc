#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export MANPAGER='nvim +Man! -c "setlocal number relativenumber"'
export MANWIDTH=80

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

PS1='[\u@\[\033[01;31m\]\h\[\033[00m\] \W]\$ '

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
