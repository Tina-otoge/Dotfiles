command! -bang -nargs=* Ag call fzf#vim#rg(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
