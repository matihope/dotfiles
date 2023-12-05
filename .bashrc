#
# ~/.bashrc
#

# Important exports:
export EDITOR='nvim'
export PATH=$PATH:~/.cargo/bin
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# misc
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
	exec fish
fi
