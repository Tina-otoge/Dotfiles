function NIMap(keys, commands)
	execute 'nmap' a:keys a:commands
	execute 'imap' a:keys '<C-o>' . a:commands
endfunction

function NXMap(keys, commands)
	execute 'nmap' a:keys a:commands
	execute 'xmap' a:keys a:commands
endfunction

nmap <C-h> :0r !headergen %<CR>0kwv$h

let mapleader = ','

" Terminal sexyness
call NIMap('<C-j>', ':terminal<CR>')
inoremap <C-l> <Esc>
nnoremap <C-l> i
tnoremap <C-l> <C-w>N
tnoremap <C-j> <C-d>

nnoremap q :quit<CR>
nnoremap Q :quitall<CR>
nnoremap s :split<CR>
nnoremap S :vsplit<CR>
nnoremap <leader>a :Git add %<CR>
nnoremap <leader>c :Git commit<CR>
nnoremap <leader>g :Git add %<bar>Git commit<CR>
call NIMap('<F7>', '<Plug>(coc-fix-current)')
call NIMap('<F8>', ':CocList diagnostics<CR>')
call NIMap('<F9>', ':NERDTreeToggle<CR>')
call NIMap('<C-F10>', ':Rg<CR>')
call NIMap('<F10>', ':Files<CR>')
call NIMap('<F11>', ':Goyo<CR>')
call NIMap('<F12>', '<Plug>(coc-definition)<CR>')
call NIMap('<C-t>', 'tabnew<CR>')

call NXMap('ga', '<Plug>(EasyAlign)')
