set nocompatible
set syntax=on
set history=300
set autoread "automatically updates files edited from outside vim
set nobackup
set noswapfile
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent

color vividchalk

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript,html,ruby,css set sw=2
autocmd FileType text set tw=80

set guifont=Menlo_Regular:h12
