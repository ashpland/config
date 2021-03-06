export PATH=$PATH:~/Documents/bin
export EDITOR=/usr/local/bin/nvim

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# export PS1='\n\[\e[0;36m\]$(set_emoji) \[\e[m\]\[\e[0;34m\]\w\[\e[m\]\[\e[0;32m\] $(parse_git_branch)\[\e[m\]\[\e[0;35m\] $(parse_git_dirty)\[\e[m\]\n\[\e[0;33m\]> \[\e[m\]'

function prompt {
    PS1=' '
    echo -e "\n$(set_emoji) $(dirs +0) $(parse_git_branch) $(parse_git_dirty)"
}

PROMPT_COMMAND='prompt'

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

alias sl="swiftlint autocorrect"
alias la="ls -a"
alias gs="gitdashboard"
alias m="cd ~/mobikes"
alias r="cd ~/reactBikes"
alias v="cat ~/.config/vimcheat.md"
alias gitam="git commit -a --amend --no-edit"
alias vi="nvim"
alias lls="while true; do clear; ls; sleep 2; done"
alias tcopy="tmux loadb -"
alias tpaste="tmux saveb -"
alias pwdcopy="pwd | tr -d '\n' | tcopy"
alias cclear="stay-cleared"

wip() {
    git commit -am "wip"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="rg --files"

. /usr/local/etc/profile.d/z.sh

complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(rbenv init -)"

export HEROKU_ORGANIZATION="opengb"

eval "$(thefuck --alias)"
eval "$(direnv hook bash)"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"

