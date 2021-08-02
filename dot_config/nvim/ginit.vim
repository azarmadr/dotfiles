if exists('g:fvim_loaded')
   " good old 'set guifont' compatibility
   set guifont=FiraCode\ Nerd\ Font:h14
   " Ctrl-ScrollWheel for zooming in/out
   nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
   nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
   nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif
se gfn=Fira\ Code
set guifont=FiraCode\ Nerd\ Font:h14
