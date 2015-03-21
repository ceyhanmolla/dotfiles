# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\[\e[0;32m\]\u\[\e[0m\]@\[\e[33m\]\h\[\e[0m\]\[\e[36m\] \W\[\e[0m\]]\[\e[31m\]\$\[\e[0m\] '
