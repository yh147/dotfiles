#!/bin/bash
source functions.sh

#  ~/.bash_profile

if [ -f "$HOME/.bash_profile" ]; then
	cp $HOME/.bash_profile $HOME/.bash_profile.bak
fi
cp ../shell/bash_profile $HOME/.bash_profile
