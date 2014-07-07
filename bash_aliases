# check the current system to set the right colorflag for ls
if ls --color > /dev/null 2>&1; then # Linux
    alias ls="ls --color=auto"
    alias ll="ls --color=auto -alF"
else # OS X
    alias ls="ls -G"
    alias ll="ls -alFG"
fi

# add color to grep searches
alias grep="grep --color=auto"

# moving up directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
