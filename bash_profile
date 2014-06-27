# add ~/bin to the `$PATH`
export PATH="$HOME/bin:$PATH"

# load the bash dotfiles
for file in ~/.bash_{aliases,extras,functions,prompt}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# enable bash tab completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

