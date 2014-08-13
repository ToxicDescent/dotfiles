# add ~/bin to the `$PATH`
export PATH="$HOME/bin:$PATH"

# load the bash dotfiles
for file in ~/.bash_{aliases,extras,functions,prompt}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# set the history to 10000 lines
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# enable bash tab completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable sudo tab completion
complete -cf sudo

# case insensitive globbing
shopt -s nocaseglob
