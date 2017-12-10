set encoding=utf-8 fileencodings=utf-8

set tabstop=8
set nocompatible
syntax on
filetype plugin indent on

set number relativenumber

set list
set listchars=tab:\·\ ,trail:.,extends:#,nbsp:.

set mouse=a

set showcmd
set ruler
set cursorline

syntax on

colorscheme molokai
hi Normal ctermbg=0
hi Visual ctermbg=238


execute pathogen#infect()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" let g:ycm_global_ycm_extra_conf = ' ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" - delete a line
map - dd
" F9 to toggle Tree 
map  <F9>  <Esc>:NERDTreeToggle<CR>
" ctrl s, z, y, c, v, x
imap <C-s> <Esc>:w<CR>a
imap <C-a> <Esc>ggvG$
vmap <C-c> y
vmap <C-x> x
imap <C-v> <Esc>gPa
imap <C-z> <Esc>ua
imap <C-y> <Esc><C-r>a
" header
imap <C-h> <Esc>:0r !tekhgen %<CR>0kwv$h
