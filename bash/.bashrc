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
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

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

export PS1="[\u@\h \w\$(generate-ps1-branch-part)] $ "

if [ -f ~/.config/.bash_aliases ]
then
	source ~/.config/.bash_aliases 
fi


eval "$(thefuck --alias)"
