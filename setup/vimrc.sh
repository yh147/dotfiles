#!/bin/bash
source functions.sh
# install Vundle

vundlePath="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$vundlePath" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git "$vundlePath"
fi

cp $HOME/.vimrc $HOME/.vimrc.bak
cat ../vim/vimrc > $HOME/.vimrc
vim +PluginInstall +qall
