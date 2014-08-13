#!/bin/bash

##################################################
# Variables
##################################################

files="bashrc bash_aliases bash_profile bash_prompt vimrc gvimrc screenrc"

##################################################

##################################################
# Functions
##################################################
function insallvim()
{
    # create the vim folder structure
    mkdir ~/.vim
    mkdir ~/.vim/{backup,bundle,swap,undo}

    # copy ycm_extras_conf to the home directory
    cp ycm_extra_conf.py ~/.ycm_extra_conf.py

    # setup vundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # install the vundle plugins
    vim +PluginInstall +qall

    # compile YouCompleteMe with the C-family language support
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
    cd -
}
##################################################

# copy the dotfiles into the home directory
for file in $files
do
    echo "Copying $file into the home directory"
    cp $file ~/.$file
done

# if the vim flag is on then install the vim plugins
if [ "$1" == "--vim" -o "$1" == "-v" ]
then
    installvim
fi

unset installvim
unset files
