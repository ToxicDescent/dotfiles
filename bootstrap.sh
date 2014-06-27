#!/bin/bash

##################################################
# Variables
##################################################

directory=~
files="bashrc bash_profile bash_prompt vimrc ycm_extra_conf.py"

##################################################


# copy the dotfiles into $directory
for file in $files
do
    echo "Copying $file into $directory."
    cp $file $directory/.$file
done


##################################################
# Vim Setup
##################################################

read -r -p "Do you wish to setup vim? [y/N]: " response

if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    # create the vim folder structure
    mkdir $directory/.vim
    mkdir $directory/.vim/{backup,bundle,swap,undo}

    # setup vundle
    git clone https://github.com/gmarik/Vundle.vim.git $directory/.vim/bundle/Vundle.vim

    # install the vundle plugins
    vim +PluginInstall +qall

    # compile YouCompleteMe with the C-family language support
    cd $directory/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
    cd -
fi

##################################################
