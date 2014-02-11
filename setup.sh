#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

function install_essential_ubuntu_packages() {
  packages=(ack-grep vim build-essential libssl-dev git mercurial)
  for package in "${packages[@]}"; do
    if [[ ! "$(dpkg --list "$package" 2>/dev/null | grep -e "^ii[[:space:]]\+$package")" ]]; then
      e_header "${package}.."
      sudo apt-get -qq install $package
    fi
  done
}

## Darwin. Ensure that we can actually compile stuff
if [[ ! "$(type -P gcc)" && "$OSTYPE" =~ ^darwin ]]; then
  e_error "Install XCode or at least the Command Line Tools first." && exit 1
fi

## *nix. Make sure we have git (Darwin ships with it) and other essentials
if [[ "$OSTYPE" =~ linux-gnu && ! "$(type -P git)" ]]; then
  install_essential_ubuntu_packages
fi

if [[ ! -d ~/.vim ]]; then
  e_header "cloning dotvim.."
  git clone git://github.com/jtinfors/dotvim.git ~/.vim
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +BundleInstall +qall
else
  e_header "Updating.."
  vim +BundleInstall! +qall
fi

[[ ! -L $HOME/.vimrc ]] && ln -s $HOME/.vim/vimrc $HOME/.vimrc
[[ ! -L $HOME/.gvimrc ]] && ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

echo "colorscheme solarized" >> $HOME/.vim/vimrc
echo "set background=dark" >> $HOME/.vim/vimrc

