set cc=81

" set autoread
autocmd BufWritePre * call PythonOnWrite()
function PythonOnWrite()
	" if system("python -m isort --version") == 0
	" 	:Dispatch! python -m isort %
	" endif
	" if system("python -m black --version") == 0
	" 	:Dispatch! python -m black %
	" endif

	CocCommand pyright.organizeimports
endfunction
