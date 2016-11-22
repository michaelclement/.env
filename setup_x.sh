#!/usr/bin/env bash
# A script to setup X settings

# CLEAR PREVIOUS SETTINGS
rm ~/.xinitrc
rm ~/.Xmodmap

# SET NEW SETTINGS
ln -s ~/.env/dotfiles/xinitrc ~/.xinitrc
ln -s ~/.env/dotfiles/Xmodmap ~/.Xmodmap
