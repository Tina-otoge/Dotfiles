if !has('nvim')
	autocmd TerminalOpen * if &buftype == 'terminal' | call TerminalCommands() | endif
endif
function TerminalCommands()
	set nonumber
	set signcolumn=no
endfunction
