" This function will be called on VimEnter event, which occurs after all
" initial configuration files (vimrc, ...) are loaded

autocmd StdinReadPre * let g:std_in=1

function VimEnterNestedCommands()
	if !exists('g:std_in')
		if argc() == 0
			exe 'edit #<1'
		endif
	endif
endfunction

function VimEnterCommands()
	if !exists('g:std_in')
		if exists('g:loaded_nerd_tree') && argc() == 1 && isdirectory(argv()[0])
			" Open an empty buffer
			exe 'enew'
			exe 'NERDTree' argv()[0]
		endif
		if exists('g:loaded_lightline')
			" Always display statusline
			set laststatus=2
			" Don't display mode under statusline (lightline already
			" displays mode)
			set noshowmode
		endif
	endif
endfunction

autocmd VimEnter * nested call VimEnterNestedCommands()
autocmd VimEnter * call VimEnterCommands()
