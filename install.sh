#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# TODO:
# - split into .alias, etc?
# - use for local mac - figure out local overrides somehow?
# - gitconfig
# - gitignore (may have to change to not using . in front of repo files)
# - git-completion.bash

dir=dotfiles                    # dotfiles directory
olddir=dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files=".profile .screenrc .vimrc .vim"

prevdir=`pwd`
cd ~
mkdir -p $olddir

# move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
  echo "Moving $file to $olddir"
  mv -i ~/$file ~/dotfiles_old/
done

# create symlinks
for file in $files; do
  echo "Creating symlink for $file in ~"
  ln -siv $dir/$file ~/
done

#mkdir -p ~/bin
#cd ~/bin
#curl http://get.zedapp.org | bash

cd $prevdir
