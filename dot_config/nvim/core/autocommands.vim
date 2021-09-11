"{ Auto commands
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

augroup term_settings
  autocmd!
  " Do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
augroup END
" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
augroup END

augroup auto_read
  autocmd!
  autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on disk. Buffer reloaded!", 'warn', {'title': 'nvim-config', 'timeout': 2500})
  autocmd FocusGained,CursorHold * if getcmdwintype() == '' | checktime | endif
augroup END
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" highlight yanked region, see `:h lua-highlight`
augroup custom_highlight
  autocmd!
  autocmd ColorScheme * call s:custom_highlight()
augroup END

function! s:custom_highlight() abort
  " For yank highlight
  highlight YankColor ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71

  " For cursor colors
  highlight Cursor cterm=bold gui=bold guibg=#00c918 guifg=black
  highlight Cursor2 guifg=red guibg=red

  " For floating windows border highlight
  highlight FloatBorder guifg=LightGreen guibg=NONE

  " highlight for matching parentheses
  highlight MatchParen cterm=underline gui=underline
endfunction

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankColor", timeout=300, on_visual=false}
augroup END

augroup auto_close_win
  autocmd!
  autocmd BufEnter * call s:quit_current_win()
augroup END

" Quit Nvim if we have only one window, and its filetype match our pattern.
function! s:quit_current_win() abort
  let quit_filetypes = ['qf', 'vista']
  let buftype = getbufvar(bufnr(), '&filetype')
  if winnr('$') == 1 && index(quit_filetypes, buftype) != -1
    quit
  endif
endfunction

augroup helpfiles
  let opts = {
        \ 'relative': 'editor',
        \ 'width':    81,
        \ 'height':   (nvim_list_uis()[0].height) - 9,
        \ 'row':      3,
        \ 'col':      (nvim_list_uis()[0].width/2)  - 27,
        \ 'anchor':   'NW',
        \ 'style':    'minimal',
        \ }
  au BufRead,BufEnter */doc/* let hb = bufnr('%') | q | call nvim_open_win(hb, 1, opts)
  au BufRead,BufEnter */doc/* nn q ZZ
augroup END
autocmd BufNewFile,BufRead,BufEnter                  /tmp/*    let g:session_autosave = 'no'
autocmd BufNewFile,BufRead          Makefile set noexpandtab
autocmd BufNewFile,BufRead,BufEnter *.do     set syntax=tcsh
autocmd BufNewFile,BufRead,BufEnter *.V      set syntax=verilog
autocmd BufNewFile,BufRead,BufEnter files.f  set syntax=off
"autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
