function custom#patch_colors#patch_molokai()
	hi SpellBad    cterm=underline ctermbg=NONE ctermfg=red
	hi Normal      ctermbg=NONE
	hi Identifier  ctermfg=7
	hi ColorColumn ctermbg=1
	hi LineNr      ctermfg=8
	hi LineNr      ctermbg=NONE
	hi Visual      ctermbg=8
	hi SignColumn  ctermbg=NONE

	" Coc
	hi CocWarningHighlight ctermfg=3
	hi CocErrorHighlight   ctermbg=1 ctermfg=0
endfunction
