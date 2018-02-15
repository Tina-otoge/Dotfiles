" Load plugins
execute pathogen#infect()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Block cursor
set guicursor=n-v-i-r-c-ci-cr:block

" Encoding
set encoding=utf-8 fileencodings=utf-8

" Indentation
" Use tabs of 4 spaces for indentation by default. Per-filetype configuration
" are in .vim/ftplugins/
set tabstop=4
set shiftwidth=4
set nocompatible
filetype plugin indent on

" Give me that sweet syntax highlighting mai boi
syntax on

" Colors
let g:rehash256 = 1
let base16colorspace=256
colorscheme molokai
hi Normal ctermbg=0
hi Visual ctermbg=238
set cursorline

" Current line displays line number and other lines display distance to
" current line
set number relativenumber

" Display invisible characters. Tabs and trailing space.
set list
set listchars=tab:\·\ ,trail:.,extends:#,nbsp:.

" Clickable terminal vim ayyyy
set mouse=a

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" Avoid zombie preview windows
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Remapping
" TODO: clean up, use no* when necessary, etc
map - dd
" Move cursor to other windows
noremap <S-Left>  <C-W>h
noremap <S-Down>  <C-W>j
noremap <S-Up>    <C-W>k
noremap <S-Right> <C-W>l
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
" Move lines
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
" F9 to toggle Tree 
map <F9> <Esc>:NERDTreeToggle<CR>
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
