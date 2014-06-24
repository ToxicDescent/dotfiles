#!/bin/bash

##################################################
# Variables
##################################################

dir=pwd
home=~
files="vimrc ycm_extra_conf.py"

##################################################


# create a symlink to the dotfiles in the home directory
for file in $files;
do
    echo "Creating a symlink to $file in the home directory."
    ln -s $file $home/.$file
done


##################################################
# Vim Setup
##################################################

# create the vim folder structure
mkdir $home/.vim
mkdir $home/.vim/{backup,bundle,swap,undo}

# setup vundle
git clone https://github.com/gmarik/Vundle.vim.git $home/.vim/bundle/Vundle.vim

# install the vundle plugins
vim +PluginInstall +qall

# compile YouCompleteMe with the C-family language support
cd $home/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd dir

##################################################
