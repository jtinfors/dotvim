set nocompatible
syntax on
set history=300
set autoread
set nobackup
set noswapfile
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set autoindent
set autoread
set encoding=utf8
set number
set ruler
set hlsearch

let mapleader = ","
let g:mapleader = ","

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript,html,ruby,css,coffee set sw=2
autocmd FileType text set tw=80

