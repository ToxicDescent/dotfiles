#!/bin/bash

##################################################
# Variables
##################################################

dot_files="bashrc bash_aliases bash_functions bash_profile bash_prompt vimrc gvimrc tmux.conf"

bin_files="battery"

##################################################

##################################################
# Functions
##################################################
function copydotfiles()
{
    for file in $dot_files
    do
        cp $file ~/.$file
    done
}

function copybinfiles()
{
    mkdir -p ~/bin

    for file in $bin_files
    do
        cp $file ~/bin/$file
    done
}

function installvim()
{
    # create the vim folder structure
    mkdir ~/.vim
    mkdir ~/.vim/{bundle,undo}

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

# copy the dot files to ~/
copydotfiles

# copy the bin files to ~/bin/
copybinfiles

# if the vim flag is on then install the vim plugins
if [ "$1" == "--vim" -o "$1" == "-v" ]
then
    installvim
fi

unset copydotfiles
unset copybinfiles
unset installvim
