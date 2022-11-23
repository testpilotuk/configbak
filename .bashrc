# .bashrc
# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Which pager to use.
export PAGER=less

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Which editor to use.
EDITOR=/usr/bin/vim
#EDITOR=/usr/bin/emacs
#EDITOR=/usr/bin/nano
export EDITOR

## The maximum number of lines in your history file
export HISTFILESIZE=500

## Append to history file; do not overwrite
shopt -s histappend

## Prevent accidental overwrites when using IO redirection
set -o noclobber

# my original kitsune prompt with cat
# export PS1='\n\[\e[0;36m\]┌─\[\e[97;1m\][\u@\h]\[\e[0;36m\]─\[\e[33;1m\](\w)\n\[\e[0;36m\]└─\[\e[32;1m\][\A]\[\e[0;36m\]-\[\e[32;1m\](\[\e[0;32m\]^_^\[\e[32;1m\])\[\e[0;36m\]-\[\e[36;1m\][\[\e[0;32m\]\[\e[32;1m\]$\[\e[36;1m\]]\[\e[0;32m\]'

# User specific aliases and functions
#alias and examples
#alias h=history
#alias jobs='jobs -l'
#alias edit=$EDITOR
alias vb="$EDITOR ~/.bashrc"
alias l.='exa -d .*'
alias la='exa -lahF'
alias ll='exa -l'
alias ls='exa'
alias reload='. ~/.bashrc'
# 
# starship bash prompt
eval "$(starship init bash)"

# functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# function for colour man pages
# man() {
#        LESS_TERMCAP_mb=$'\e[01;32m'
#        LESS_TERMCAP_md=$'\e[01;32m' \
#        LESS_TERMCAP_me=$'\e[0m' \
#        LESS_TERMCAP_se=$'\e[0m' \
#        LESS_TERMCAP_so=$'\e[01;33m' \
#        LESS_TERMCAP_ue=$'\e[0m' \
#        LESS_TERMCAP_us=$'\e[1;4;31m' \
#    
#        command man "$@"
#}

#Neofetch
neofetch
