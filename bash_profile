export PATH=$PATH:~/Documents/bin

export PS1='\n\[\e[0;36m\]$(set_emoji) \[\e[m\]\[\e[0;34m\]\w\[\e[m\]\[\e[0;32m\] $(parse_git_branch)\[\e[m\]\[\e[0;35m\] $(parse_git_dirty)\[\e[m\]\n\[\e[0;33m\]> \[\e[m\]'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function set_emoji() {
    HOSTNAME=$(hostname)

        if [ "$HOSTNAME" = "hearthedge.local" ]; then
            echo "🌲"
                elif [ "$HOSTNAME" = "mokosh.local" ]; then
                echo "🔮"
        else
            echo "🌲"
                fi
}

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

# alias sl="swiftlint autocorrect"
alias la="ls -a"
alias gs="gitdashboard"
alias m="cd ~/mobikes"
alias r="cd ~/reactBikes"
alias v="cat ~/.config/vimcheat.md"
alias gitam="git commit -a --amend --no-edit"

wip() {
    git commit -am "wip"
}

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Source: https://stackoverflow.com/a/10660730
rawurlencode() {
    local string="${1}"
        local strlen=${#string}
    local encoded=""
        local pos c o

        for (( pos=0 ; pos<strlen ; pos++ )); do
            c=${string:$pos:1}
    case "$c" in
    [-_.~a-zA-Z0-9] ) o="${c}" ;;
    * )               printf -v o '%%%02x' "'$c"
        esac
        encoded+="${o}"
        done
        echo "${encoded}"    # You can either set a return variable (FASTER) 
        REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

# Returns a string in which the sequences with percent (%) signs followed by
# two hex digits have been replaced with literal characters.
rawurldecode() {

# This is perhaps a risky gambit, but since all escape characters must be
# encoded, we can replace %NN with \xNN and pass the lot to printf -b, which
# will decode hex for us

    printf -v REPLY '%b' "${1//%/\\x}" # You can either set a return variable (FASTER)

        echo "${REPLY}"  #+or echo the result (EASIER)... or both... :p
}

. /usr/local/etc/profile.d/z.sh

complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make