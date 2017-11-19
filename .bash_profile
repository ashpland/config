#export PS1="\e[0;36m△ \W:\e[m "
#export PS1="\n\[\e[0;36m\]△ \[\e[m\]\[\e[0;34m\]\w\[\e[m\]\[\e[0;32m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\e[m\]\[\e[0;33m\]\n> \[\e[m\]"

export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '


export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function parse_git_dirty {
      [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


