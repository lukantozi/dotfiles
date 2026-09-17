#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export MANPAGER='nvim +Man!'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

if [[ $- == *i* && -z ${TMUX-} ]]; then
    bind '"\C-f": "tmux-sessionizer\n"'
fi

alias vim=nvim
