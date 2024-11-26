#!/usr/bin/env bash

# Exit for non-interactive sessions.
[[ $- != *i* ]] && return

#
# Environment vars.
#
export VISUAL=nvim
export EDITOR=$VISUAL

#
# Autocompletion, syntax highlighting ect
#

set -o vi
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind -x '"\C-l": clear'

#
# Generate prompt
#
this-git-branch() {
	local branch=$(git branch 2> /dev/null | grep '^\*' | sed 's/\* //')
	echo $branch
}

generate-ps1-branch-part() {
	local branch=$(this-git-branch)
	if [[ -z "$branch" ]]
	then
		local branch_prompt=""
	else
		local branch_prompt=" ($branch)"
	fi
	echo "$branch_prompt"
}

export PS1="\[\033[01;1m\][ \[\033[01;32m\]\u@\h \W\$(generate-ps1-branch-part)\[\033[00m\] \[\033[01;1m\]] \[\033[01;1m\]\$ \[\033[00m\]"

if [ -f ~/.config/.bash_aliases ]
then
	source ~/.config/.bash_aliases 
fi

if [ -d "$HOME/.local/bin" ]
then
	PATH="$HOME/.local/bin:$PATH"
fi

eval "$(thefuck --alias)"
. "$HOME/.cargo/env"
