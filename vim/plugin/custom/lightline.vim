""""""""""""""""""""""""""""""""""""""
" lightline.vim-specific configuration
""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'active': {
\	'left': [['mode'],
\	         ['readonly', 'filename', 'cocstatus', 'currentfunction', 'gitbranch']],
\	'right': [['fileformat', 'fileencoding', 'filetype'], ['lineinfo'], ['percent']]
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
