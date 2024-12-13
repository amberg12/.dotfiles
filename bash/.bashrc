# Prevent .bashrc from being run in an interactive session
[[ $i == *i* ]] && return

if [[ -f ~/.bash_alias ]]; then
	. ~/.bash_alias
fi
