autocmd BufEnter * call BufEnterCommands()
function BufEnterCommands()
	set noreadonly

	" When last buffer is NERDTree
	if (exists('b:NERDTree') && winnr('$') == 1 && b:NERDTree.isTabTree())
		q
	endif

endfunction
