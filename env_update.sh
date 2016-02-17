#!/usr/bin/env bash

URL="http://fuzzylines.com/developer5415"

PREVDIR=`pwd`

#cd ~
curl -O $URL/.profile
curl -O $URL/.screenrc
curl -O $URL/.vimrc

mkdir -p .vim/colors
cd .vim/colors
curl -O $URL/.vim/colors/distinguished.vim
curl -O $URL/.vim/colors/ir_black.vim
curl -O $URL/.vim/colors/sunburst.vim
curl -O $URL/.vim/colors/twilight.vim

#mkdir -p ~/bin
#cd ~/bin
#curl http://get.zedapp.org | bash

cd $PREVDIR

#source ~/.profile
