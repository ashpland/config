export PATH=$PATH:~/Documents/bin

export PS1='\n\[\e[0;36m\]△ \[\e[m\]\[\e[0;34m\]\w\[\e[m\]\[\e[0;32m\] $(parse_git_branch)\[\e[m\]\[\e[0;35m\] $(parse_git_dirty)\[\e[m\]\n\[\e[0;33m\]> \[\e[m\]'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function parse_git_dirty {
	ERROR=$(git status 2>&1 >/dev/null)
	
	if [[ $ERROR != *"fatal"* ]] ; then
		STATUS=$(git status 2> /dev/null | tail -n1)
		if [[ $STATUS != *"nothing to commit"* ]] ; then
			echo "♺"
		fi
	fi
}

function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

export LANG=en_US.UTF-8

if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
  fi
