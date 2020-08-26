#!/bin/bash

dir=dotfiles                    # dotfiles directory
olddir=dotfiles-pre-fuzzy       # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="profile zshrc screenrc vimrc vim gitconfig gitignore bash_profile bashrc"

prevdir=`pwd`
cd ~

# Remove links
for file in $files; do
  if [ -L ~/.$file ]; then
    echo "Removing symlink .$file"
    rm ~/.$file
  fi
done

echo "Moving old dotfiles back to home"
shopt -s dotglob nullglob
mv -i ~/$olddir/* ~/
shopt -u dotglob nullglob

# Remove dotfiles dir
rm -rf $dir

# Uninstall oh-my-zsh
uninstall_oh_my_zsh
rm -rf ~/.oh-my-zsh

rmdir $olddir

#echo "Change shell to bash?"
#select yn in "Yes" "No"; do
#    case $yn in
#        Yes ) chsh -s $(which bash); break;;
#        No ) break;;
#    esac
#done

while true; do
  read -p "Change shell to bash? " yn
  case $yn in
    [Yy]* ) chsh -s $(which bash); break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no.";;
  esac
done

cd $prevdir
