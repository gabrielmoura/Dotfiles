#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH=$PATH:/snap/bin
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

complete -C /usr/bin/mcli mcli
