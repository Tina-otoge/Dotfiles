let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_language_server = [ { 'name': 'haskell', 'filetypes': [ 'haskell', 'hs', 'lhs' ], 'cmdline': [ 'hie-wrapper' ], 'project_root_files': [ '.stack.yaml', 'cabal.config', 'package.yaml' ] } ]

