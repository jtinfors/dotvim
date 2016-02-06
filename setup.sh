#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

function install_essntial_osx_packages() {
  if [[ ! "$(type -P gcc)" ]]; then
    e_error "Install XCode or at least the XCode Command Line Tools first." && exit 1
  fi
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  brew zsh install git git-extras the_silver_searcher
}

function install_essential_ubuntu_packages() {
  packages=(zsh ack-grep vim build-essential libssl-dev git silversearcher-ag)
  for package in "${packages[@]}"; do
    if [[ ! "$(dpkg --list "$package" 2>/dev/null | grep -e "^ii[[:space:]]\+$package")" ]]; then
      e_header "${package}.."
      sudo apt-get -qq install $package
    fi
  done
}

function install_powerline_fonts_ubuntu() {
  if [[ ! -d ~/projects/fonts ]]; then
    git clone git@github.com:powerline/fonts.git $HOME/projects/fonts
    cd $HOME/projects/fonts && ./install.sh && cd -
    fc-cache -vf $HOME/.local/share/fonts
  fi
}

## Darwin. Ensure that we can actually compile stuff
if [[ "$OSTYPE" =~ ^darwin ]]; then
  install_essntial_osx_packages
elif [[ "$OSTYPE" =~ linux-gnu ]]; then
  install_essential_ubuntu_packages
  install_powerline_fonts_ubuntu
fi

if [[ ! -d ~/.vim ]]; then
  e_header "cloning.."

  git clone git://github.com/jtinfors/dotvim.git ~/.vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  [[ ! -L $HOME/.vimrc ]] && ln -s $HOME/.vim/vimrc $HOME/.vimrc
  [[ ! -L $HOME/.gvimrc ]] && ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

  vim +BundleInstall +qall
fi

## Set zsh as default shell
if [[ "$(ps -hp $$ | awk '{print $5}')" =~ "/bin/bash" ]]; then
  chsh -s `which zsh`
fi

