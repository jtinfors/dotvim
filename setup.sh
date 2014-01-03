#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

## Darwin. Ensure that we can actually, like, compile anything.
if [[ ! "$(type -P gcc)" && "$OSTYPE" =~ ^darwin ]]; then
  e_error "XCode or the Command Line Tools for XCode must be installed first."
  exit 1
fi

## *nix. Make sure we have git (Darwain ships with it)
if [[ "$OSTYPE" =~ linux-gnu && ! "$(type -P git)" ]]; then
  e_header "Installing Git"
  sudo apt-get -qq install git
fi

if [[ ! -d ~/.vim ]]; then
  e_header "Downloading dotfiles"
  git clone --recursive git://github.com/jtinfors/dotvim.git ~/.vim
  cd ~/.vim
else
  e_header "Updating dotfiles"
  cd ~/.vim
  git pull
  git submodule update --init --recursive --quiet
  cd -
fi

cd $HOME
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc

## Ignore untracked files in submodules
for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done
