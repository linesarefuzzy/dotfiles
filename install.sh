#!/bin/bash
# This script creates symlinks from the home directory to specified dotfiles in ~/dotfiles, adds SSH key to authorized_keys, and installs vim plugins.

dir=dotfiles                    # dotfiles directory
olddir=dotfiles-pre-fuzzy       # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="profile zshrc screenrc vimrc vim gitconfig gitignore bash_profile bashrc"

prevdir=`pwd`
cd ~
mkdir -p $olddir

# Install oh-my-zsh
omzsource="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
sh -c "$(curl -fsSL $omzsource || wget -O- $omzsource)" "" --unattended || {
  echo "Error: Could not install Oh My Zsh" >/dev/stderr
}

# Move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
  if [ -e .$file ] && [ ! -L .$file ]; then
    echo "Moving .$file to $olddir"
    mv -i ~/.$file ~/$olddir/
  fi
done

# Create symlinks
for file in $files; do
  if [ ! -L .$file ]; then
    echo "Creating symlink for .$file in ~"
    ln -sivn $dir/$file ~/.$file
  fi
done

# Add SSH key
mkdir -p .ssh
grep -qxFf $dir/id_rsa.pub .ssh/authorized_keys || cat $dir/id_rsa.pub >> .ssh/authorized_keys

# Install Vundle and vim plugins
echo "git clone https://github.com/VundleVim/Vundle.vim.git $dir/vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git $dir/vim/bundle/Vundle.vim
echo "vim +PluginInstall +qall"
vim +PluginInstall +qall

while true; do
  read -p "Change shell to zsh? " yn
  case $yn in
    [Yy]* ) chsh -s $(which zsh); break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no.";;
  esac
done

cd $prevdir

echo "Install autojump: [sudo] (apt[-get]|brew|yum|...) install autojump"
