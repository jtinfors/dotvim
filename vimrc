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
set hidden
set backspace=eol,start,indent  " allow backspacing over everything in insert mode"
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

command! W :w
let mapleader = ","
let g:mapleader = ","

nmap <leader>lw :CtrlP<CR><C-\>w
vmap <leader>lw y:CtrlP<CR><C-\>c

function! SearchCurrentWord()
	let l:wuc = expand("<cword>")
	execute ":Ag " . l:wuc
endfunction
nnoremap <leader>a :call SearchCurrentWord()<cr>

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'quanganhdo/grb256'
call vundle#end()
filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType sh,groovy,xml,html,ruby,css,coffee set sw=2
autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType java set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab "SVT dev env
autocmd FileType text set tw=80

autocmd! bufwritepost vimrc so %

syntax enable
set listchars=tab:▸\ ,trail:·,eol:¬ " From iljo to display friendlier chars for :list

" NERDTree stuff
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

set tags=./tags;
let g:ctrlp_custom_ignore = { 'dir':  '\./dist$|\./target$|\.git$\|\.hg$\|\.svn$|\./build$', 'file': '\.so$', }

" vim-airline stuff
set laststatus=2
let g:airline_powerline_fonts = 1
let g_airline_theme = "molokai"
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256

set background=dark

let g:syntastic_javascript_checkers = ['eslint']
