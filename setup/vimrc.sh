#!/bin/bash
source functions.sh
# install Vundle

vundlePath="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$vundlePath" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git "$vundlePath"
fi

cat ../vim/vimrc > $HOME/.vimrc
vim +PluginInstall +qall
