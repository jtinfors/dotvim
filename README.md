# My Vim Config

This is my very much personal repo for my vim dot files. I use it to easily set up a new machine

## Setup:
`git clone <url> ~/.vim`
`ln -s .vim/vimrc .vimrc`
`ln -s .vim/gvimrc .gvimrc`

## To add a submodule do:
`git submodule add <url> <folder>`
`git submodule init`

## Update a submodule:
`git submodule update`

## Update all submodules:
`git submodule foreach git pull origin master`

## Remove a submodule:
There is not efficient way to remove a submodule
* first step is remove references to the submodule in .gitmodules and .git/config.
* Then git rm --cached .vim/bundle/fugitive

## more at =>
http://www.allenwei.cn/tips-using-git-submodule-keep-your-plugin-up-to-date/
