# Prevent .bashrc from being run in an interactive session
[[ $i == *i* ]] && return

if [[ -f ~/.bash_alias ]]; then
	. ~/.bash_alias
fi


git -v 2>&1 1>/dev/null && git-this-branch() {
	local branch=$(git branch 2>/dev/null | grep '^\*.*' 2>/dev/null)
	if [[ -n "$branch" ]]; then	
		echo "${branch:2}"
	fi
}

paren-if-exists() {
	if [[ -n "$1" ]]; then
		echo "($1)"
	fi
}

git-ps1-branch-name() {
	if git -v 2>&1 1>/dev/null; then
		:
	else
		return 0
	fi

	if type -t git-this-branch 2>&1 1>/dev/null; then
		:
	else
		return 0
	fi

	local fbranch=$(paren-if-exists $(git-this-branch))
	if [[ -n "$fbranch" ]]; then
		printf " $fbranch"
	fi
}

PS1='[\u@\h \w$(git-ps1-branch-name)] $ '

# Sourcing packages that are strange.
eval "$(thefuck --alias)" 2>/dev/null
. "$HOME/.cargo/env" 2>/dev/null
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
