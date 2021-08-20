inoremap jk <ESC>
let mapleader = "\<Space>"
set encoding=utf-8
set background=dark

" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable filetype detection. Vim will try to detect the type of file in use
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn syntax highlighting on
syntax on

" Add numbers to each line on the left-hand side
set number

" Set shift width to 2 spaces
set shiftwidth=4

" Set tab width to 2 columns
set tabstop=4

" Use spaces instead of tabs
set expandtab

" Use shiftwidth instead of tabstop at the start of lines
set smarttab

" Linebreak on 80 characters
set lbr
set tw=80

" Auto indent
set ai

" Wrap lines
set wrap

" Show the mode you are on the last line
set showmode

" Show matching words during a search
set showmatch

" Use highlighting when doing a search
set hlsearch

" While searching though a file incrementally highlight matching characters as
" you type
set incsearch
