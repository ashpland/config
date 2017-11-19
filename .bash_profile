#export PS1="\e[0;36m△ \W:\e[m "
export PS1="\n\[\e[0;36m\]△ \[\e[m\]\[\e[0;34m\]\w\[\e[m\]\[\e[0;32m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\e[m\]\[\e[0;33m\]\n> \[\e[m\]"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

