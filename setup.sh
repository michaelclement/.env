#!/usr/bin/env bash
# A script to setup my environment settings.

# CLEAR PREVIOUS SETTINGS
cd ~
rm .vimrc
rm .bashrc
rm .bash_profile
rm .gitconfig
rm .screenrc
rm .inputrc
rm .vim

# CREATE NEW SETTINGS
ln -s ~/.env/dotfiles/vimrc ~/.vimrc
ln -s ~/.env/dotfiles/bashrc ~/.bashrc
ln -s ~/.env/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.env/dotfiles/gitconfig ~/.gitconfig
ln -s ~/.env/dotfiles/screenrc ~/.screenrc
ln -s ~/.env/dotfiles/inputrc ~/.inputrc
ln -s ~/.env/dotfiles/vim ~/.vim

cd ~/.env/dotfiles/vim
git submodule init
git submodule update
