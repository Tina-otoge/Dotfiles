
autocmd TerminalOpen * if &buftype == 'terminal' | call TerminalCommands() | endif
function TerminalCommands()
    set nonumber
    set signcolumn=no
endfunction
