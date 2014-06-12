# create the backup directory
mkdir ~/dotfile_backups

# backup all of the vim files and folders
mv ~/.vim ~/dotfile_backups
mv ~/.vimrc ~/dotfile_backups
mv ~/.ycm_extra_conf.py ~dotfile_backups

# create the vim folder structure
cp .vim/ ~/
mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo

# copy the .vimrc to the home directory
cp .vimrc ~/

# install the vim plugins
vim +PluginInstall +qall

# compile YouCompleteMe with the C-family language support
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd -

# copy the ycm_extra_conf file to the home directory
cp .ycm_extra_conf.py ~/
