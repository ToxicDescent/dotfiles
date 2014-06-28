# check the current system to set the right colorflag
if ls --color > /dev/null 2>&1; then # Linux
    colorflag="--color=auto"
else # OS X
    colorflag="-G"
fi

alias ls="ls ${colorflag}"
alias ll="ls -alF ${colorflag}"

alias grep="grep --color=auto"
