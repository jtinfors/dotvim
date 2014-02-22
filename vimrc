set nocompatible
set history=300
set autoread
set nobackup
set nowritebackup
set noswapfile
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set smartindent
set encoding=utf8
set fileformats=unix,dos,mac
set number
set ruler
set hlsearch
set incsearch
set showmatch
set scrolloff=1
set wildmenu
set ignorecase
set smartcase
set wildignore=*.swp,*.bak,*.pyc,*.class
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

command! W :w
let mapleader = ","
let g:mapleader = ","

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'kana/vim-smartinput'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shutnik/jshint2.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'bling/vim-airline'

filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType sh,groovy,xml,java,javascript,html,ruby,css,coffee set sw=2
autocmd FileType java set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType text set tw=80

syntax enable

" NERDTree stuff
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

set tags=./tags;
let g:ctrlp_custom_ignore = { 'dir':  '\./dist$|\./target$|\.git$\|\.hg$\|\.svn$|\./build$', 'file': '\.so$', }

" vim-airline stuff
set laststatus=2
let g:airline_powerline_fonts = 1
let g_airline_theme = "jellybeans"
let g:airline#extensions#tabline#enabled = 0

