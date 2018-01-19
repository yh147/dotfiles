#!/bin/bash
source functions.sh

#install Homebrew and create SSH key pairs

if ! command -v brew >/dev/null; then
    yyq_echo "Installing Homebrew ..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    yyq_echo "Homebrew installed"
fi

yyq_echo "Setting up Github SSH key pairs."
echo "Please enter your github email."
read github_email
ssh-keygen -t rsa -b 4096 -C $github_email

yyq_echo "Copying SSH key to your clipboard."
pbcopy < ~/.ssh/id_rsa.pub

yyq_echo "Add key to github to finish setup."

yyq_echo "Please enter user.name."
read user_name
git config --global user.name $user_name

yyq_echo "Please enter user.email."
read user_email
git config --global user.email $user_email
