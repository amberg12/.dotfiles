# Aliases
alias :q="exit"
alias ..="cd .."
alias ...="cd ..."
alias ....="cd ...."
alias .....="cd ....."
alias ......="cd ......"
alias .......="cd ......."
alias ........="cd ........"
alias .........="cd ........."
alias ..........="cd .........."
alias ...........="cd ..........."
alias ............="cd ............"
alias .............="cd ............."
alias ..............="cd .............."
alias ...............="cd ..............."

alias la="ls -A"

# Exports

export VISUAL=nvim
export EDITOR=nvim

# Binds

# Enable colors, change prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b) '
zstyle ':vcs_info:*' enable git
PS1="[%1~] "
PS1+=\$vcs_info_msg_0_
PS1+="$ "

# History
HISTSIZE=10000
SAVEHIST=10000
mkdir -p ~/.cache/zsh
HISTFILE=~/.cache/zsh/history

# Basic complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#VI mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]
  then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]
  then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  zle -K viins
  echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# CTRL-E for neovim
autoload edit-command-line; zle --N edit-command-line
bindkey '^e' edit-command-line

# Load plugins

# Syntax highlighting must go last.
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
