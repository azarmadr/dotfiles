if exists('g:fvim_loaded')
   " good old 'set guifont' compatibility
   set guifont=FiraCode\ Nerd\ Font:h14
   " Ctrl-ScrollWheel for zooming in/out
   nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
   nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
   nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif
if exists('g:glrnvim_gui')
  se lines=52
endif
