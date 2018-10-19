#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'

#
export PS1='[\u@\h \W]\$ '
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/rc

#
source $HOME/.config/git-completion.bash

#
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}
