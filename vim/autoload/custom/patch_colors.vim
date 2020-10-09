function custom#patch_colors#patch_molokai()
	hi SpellBad    cterm=underline ctermbg=NONE ctermfg=red
	hi Normal      ctermbg=NONE guibg=NONE
	hi Identifier  ctermfg=7
	hi ColorColumn ctermbg=1
	hi LineNr      ctermfg=8
	hi LineNr      ctermbg=NONE guibg=NONE
	hi Visual      ctermbg=8
	hi SignColumn  ctermbg=NONE guibg=NONE

	" Coc
	hi CocWarningHighlight ctermbg=3 ctermfg=7
	hi CocErrorHighlight   ctermbg=1 ctermfg=0

	" GitGutter
	highlight GitGutterAdd    ctermfg=2 ctermbg=NONE guibg=NONE
	highlight GitGutterChange ctermfg=3 ctermbg=NONE guibg=NONE
	highlight GitGutterDelete ctermfg=1 ctermbg=NONE guibg=NONE
endfunction
