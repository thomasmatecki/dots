# =============================================================== #
#
# =============================================================== #
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/thomas/google-cloud-sdk/path.bash.inc' ]; 
    then source '/home/thomas/google-cloud-sdk/path.bash.inc'; 
fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/thomas/google-cloud-sdk/completion.bash.inc' ]; 
    then source '/home/thomas/google-cloud-sdk/completion.bash.inc'; 
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/thomas/.sdkman"
[[ -s "/home/thomas/.sdkman/bin/sdkman-init.sh" ]] && source "/home/thomas/.sdkman/bin/sdkman-init.sh"

export SPARK_HOME=/usr/local/spark

# UGH
export PATH="$PATH":$HOME/flutter/bin
export PATH="$PATH":$HOME/.pub-cache/bin
export PATH="$PATH":/opt/dart-sdk/bin
export PATH="$PATH":/opt/gradle/gradle-4.6/bin
export PATH="$PATH":/home/thomas/Android/Sdk/emulator
export PATH="$PATH":/opt/heroku/bin
export PATH="$PATH":"$HOME/.cargo/bin"
export PATH="$PATH":"$HOME/.pyenv/bin"

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

    # Display an Eggplant in tmux
    if [[ ! -z "$TMUX" ]];then
        PS1+="🍆"
    fi

    if [ $EXIT != 0 ]; then
        # Add red if exit code non 0
        PS1+="${Red}${EXIT}${RCol} \n$ ${RCol}" 
    else
        PS1+="\n$ ${RCol}"
    fi
}

#source ~/git-completion.bash

alias r="ranger"
alias gl="git log --oneline --graph --color"
alias gs="git status"
alias c="clear"

# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
