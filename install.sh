#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=dotfiles                    # dotfiles directory
olddir=dotfiles-pre-fuzzy       # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="profile zshrc screenrc vimrc vim gitconfig gitignore"

prevdir=`pwd`
cd ~
mkdir -p $olddir

# Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Use this for now in order to not start zsh at the end (https://github.com/robbyrussell/oh-my-zsh/issues/5873)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" >/dev/stderr
  exit 1
}

# move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
  if [ -f .$file ] && [ ! -L .$file ]; then
    echo "Moving .$file to $olddir"
    mv -i ~/.$file ~/$olddir/
  fi
done

# create symlinks
for file in $files; do
  echo "Creating symlink for .$file in ~"
  ln -sivn $dir/$file ~/.$file
done

# Install Vundle and vim plugins
echo "git clone https://github.com/VundleVim/Vundle.vim.git $dir/vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git $dir/vim/bundle/Vundle.vim
vim +PluginInstall +qall

#echo "Change shell to zsh?"
#select yn in "Yes" "No"; do
#    case $yn in
#        Yes ) chsh -s $(which zsh); break;;
#        No ) break;;
#    esac
#done

cd $prevdir
