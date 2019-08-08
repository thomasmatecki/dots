# =============================================================== #
# 18 Jun 2018 : Added NVM_DIR(node version manager)
#
# =============================================================== #

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For flutter
export PATH=~/flutter/bin:$PATH
export PATH=$PATH:$HOME/.pub-cache/bin
export SPARK_HOME=/usr/local/spark

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]' 	# Right color

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'
     
    # Prompt prefix
    PS1="${BBlu}\w${BYel}$(parse_git_branch)${RCol} "

    if [[ ! -z "$VIRTUAL_ENV" ]];then
        PS1+="🐍"
    fi

    if [[ ! -z "$TMUX" ]];then
        PS1+="🍆"
    fi

    if [ $EXIT != 0 ]; then
        PS1+="${Red}${EXIT}${RCol} \n$ ${RCol}"      # Add red if exit code non 0
    else
        PS1+="\n$ ${RCol}"
    fi
}

source ~/git-completion.bash

alias r="ranger"
alias gl="git log --oneline --graph --color"
alias gs="git status"
alias c="clear"

alias apon="blueutil --connect 7c-9a-1d-c0-37-a9"
alias apoff="blueutil --disconnect 7c-9a-1d-c0-37-a9"

