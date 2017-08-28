#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=dotfiles                    # dotfiles directory
olddir=dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="profile bash_profile zshrc screenrc vimrc vim"

prevdir=`pwd`
cd ~
mkdir -p $olddir

# move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
  echo "Moving .$file to $olddir"
  mv -i ~/.$file ~/dotfiles_old/
done

# create symlinks
for file in $files; do
  echo "Creating symlink for .$file in ~"
  ln -siv $dir/$file ~/.$file
done

#mkdir -p ~/bin
#cd ~/bin
#curl http://get.zedapp.org | bash

echo "Change shell to zsh?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) chsh -s $(which zsh); break;;
        No ) exit;;
    esac
done

cd $prevdir
