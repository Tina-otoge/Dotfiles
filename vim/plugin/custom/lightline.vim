""""""""""""""""""""""""""""""""""""""
" lightline.vim-specific configuration
""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'active': {
\	'left': [['mode'],
\	         ['readonly', 'filename', 'gitbranch']]
\ },
\ 'component_function': {
\	'filename': 'LightlineFilename',
\	'gitbranch': 'gitbranch#name'
\ },
\ }
" Replace default filename component with a combined filename + modified
" component, append * to filename if current file has been modified
function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No name]'
	let modified = &modified ? '*' : ''
	return filename . modified
endfunction
