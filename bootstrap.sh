#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files=".profile .screenrc .vimrc .vim"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "$file"
  mv ~/.$file ~/dotfiles_old/
  ln -s $dir/$file ~/.$file
done

#mkdir -p ~/bin
#cd ~/bin
#curl http://get.zedapp.org | bash

cd $prevdir

source ~/.profile
