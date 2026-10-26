#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export MANPAGER='nvim +Man! -c "setlocal number relativenumber"'
export MANWIDTH=80

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='[\u@\[\033[01;31m\]\h\[\033[00m\] \W]\$ '

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

if [[ $- == *i* && -z ${TMUX-} ]]; then
    bind '"\C-f": "tmux-sessionizer\n"'
fi

alias vim=nvim
