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

# User specific aliases and functions
alias vb="$EDITOR ~/.bashrc"
alias va="$EDITOR ~/.config/alacritty/alacritty.yml"
alias l.='exa -d .*'
alias la='exa -lahF'
alias ll='exa -l'
alias ls='exa'
alias reload='. ~/.bashrc'
 
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

#Neofetch
neofetch
