#!/bin/bash
source functions.sh
# install Vundle

vundlePath="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$vundlePath" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git "$vundlePath"
fi

if [ -f "$HOME/.vimrc" ]; then
	cp $HOME/.vimrc $HOME/.vimrc.bak
fi
cat ../vim/vimrc > $HOME/.vimrc
vim +PluginInstall +qall
