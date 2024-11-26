alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."

if fastfetch -v 1>/dev/null 2>/dev/null
then
	alias neofetch=fastfetch
fi

if ! type vim 1>/dev/null 2>/dev/null
then
	# Usually vi is just vim anyway
	alias vim=vi
fi
