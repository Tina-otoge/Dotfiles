" This function will be called on VimEnter event, which occurs after all
" initial configuration files (vimrc, ...) are loaded

autocmd VimEnter * call VimEnterCommands()
function VimEnterCommands()
	" If lightline.vim is present, change status line options, use
	" defaults otherwise
	if exists('g:loaded_lightline')
		" Always display statusline
		set laststatus=2
		" Don't display mode under statusline (lightline already
		" displays mode)
		set noshowmode
	endif
endfunction
