""""""""""""""""""""""""""""""""""""""
" lightline.vim-specific configuration
""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'active': {
\	'left': [['mode'],
\	         ['cocstatus', 'currentfunction', 'readonly', 'filename', 'gitbranch']]
\ },
\ 'component_function': {
\	'filename': 'LightlineFilename',
\	'gitbranch': 'gitbranch#name',
\	'cocstatus': 'coc#status',
\	'currentfunction': 'CocCurrentFunction'
\ },
\ }
" Replace default filename component with a combined filename + modified
" component, append * to filename if current file has been modified
function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No name]'
	let modified = &modified ? '*' : ''
	return filename . modified
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
