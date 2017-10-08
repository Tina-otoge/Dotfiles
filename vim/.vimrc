set encoding=utf-8 fileencodings=utf-8

set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on

set number relativenumber

set list
set listchars=tab:\│\ ,trail:.,extends:#,nbsp:.

set mouse=a

set textwidth=80
set cc=80

set showcmd
set ruler

syntax on

execute pathogen#infect()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
