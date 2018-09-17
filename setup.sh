#!/usr/bin/env bash
# A script to setup my environment settings.

# FUNCTION - CLEAR PREVIOUS SETTINGS {{{
function clear_settings() {
  printf "Clearing previous settings...\n\n"
  cd ~
  rm .vimrc
  rm .bashrc
  rm .bash_profile
  rm .gitconfig
  rm .inputrc
  rm .vim
  rm -rf ~/.config/tilix
}
# }}}
# FUNCTION - CREATE NEW SETTINGS {{{
function create_settings() {
  printf "Symlinking new settings...\n\n"
  ln -s ~/.env/dotfiles/vimrc ~/.vimrc
  ln -s ~/.env/dotfiles/bashrc ~/.bashrc
  ln -s ~/.env/dotfiles/bash_profile ~/.bash_profile
  ln -s ~/.env/dotfiles/gitconfig ~/.gitconfig
  ln -s ~/.env/dotfiles/inputrc ~/.inputrc
  ln -s ~/.env/dotfiles/vim ~/.vim
  mkdir -p ~/.config/tilix
  ln -s ~/.env/tilix_themes ~/.config/tilix/schemes
}
# }}}
# FUNCTION - INITIALIZE SUBMODULES {{{
function init_submodules() {
  printf "Initializing submodules...\n"
  cd ~/.env
  git submodule init
  git submodule update
  printf "\n"
}
# }}}
# FUNCTION - INSTALL VIM {{{
function install_vim() {
  read -p 'Would you like to install Vim? (y/n) ' -n1 answer
  printf "\n\n"
  if [[ $answer = [yY] ]]; then
    printf "Installing Vim..."
    printf "\n"
    sudo apt-get install -y vim
    printf "\n"
    printf "Initializing vim plugins..."
    printf "\n\n"
    vim +PlugUpgrade +PlugUpdate +qall
    install_ag
  fi
}
# }}}
# FUNCTION - INSTALL AG {{{
function install_ag() {
  # INSTALL AG THE SILVER SEACHER
  printf "Ag the Silver Searcher is required for Vim CTRL-P Plugin.\n"
  read -p 'Would you like to install ag? (y/n) ' -n1 answer
  printf "\n\n"
  if [[ $answer = [yY] ]]; then
    printf "Installing ag..."
    printf "\n"
    sudo apt-get install -y silversearcher-ag
    printf "\n"
  fi
}
# }}}
# FUNCTION - INSTALL TILIX {{{
function install_tilix() {
  read -p 'Would you like to install Tilix? (y/n) ' -n1 answer
  printf "\n\n"
  if [[ $answer = [yY] ]]; then
    printf "Installing Tilix..."
    printf "\n"
    sudo apt-get install -y tilix
    printf "\n"
    printf "###################################################################"
    printf "\n"
    printf "Enable preferred color scheme under Preferences -> Default -> Color"
    printf "\n"
    printf "###################################################################"
    printf "\n\n"
  fi
}
# }}}
# FUNCTION - RUN {{{
function run() {
  # RUN ALL FUNCTIONS
  printf "\n"
  printf "==================================================================="
  printf "\n\n"
  printf "Beginning environment setup."
  printf "\n\n"
  clear_settings
  create_settings
  init_submodules
  install_vim
  install_tilix
  printf "Environment setup complete."
  printf "\n\n"
  printf "==================================================================="
  printf "\n\n"
}
# }}}

# RUN SETUP
run

# ensures that vim uses fold markers and is folded by default
# vim:foldmethod=marker:foldlevel=0
