"_set_options
set et
set sw=2
syntax on
set mouse=a
set cursorline
set diffopt=vertical
set nu relativenumber
filetype plugin indent on
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

"_sourcing_functions
so ~\Appdata\Local\nvim\fu.vim
so ~\Appdata\Local\nvim\coc-fu.vim
so ~\Appdata\Local\nvim\fern.vim

"_auto_commands
augroup helpfiles
  au!
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
autocmd BufNewFile,BufRead          Makefile set noexpandtab
autocmd BufNewFile,BufRead,BufEnter *.do     set syntax=tcsh
autocmd BufNewFile,BufRead,BufEnter *.V      set syntax=verilog
autocmd BufNewFile,BufRead,BufEnter files.f  set syntax=off
augroup sv_bindings
   autocmd! sv_bindings
   autocmd Filetype verilog       ino <buffer> <silent> be<CR> begin<CR>end<ESC>O
   autocmd Filetype verilog       ino <buffer> <silent> cl<CR> class<CR>endclass<Up>
   autocmd Filetype verilog       ino <buffer> <silent> fu<CR> function<CR>endfunction<Up>
   autocmd Filetype verilog       ino <buffer> <silent> ta<CR> task<CR>endtask<Up>
   autocmd Filetype verilog       ino <buffer> <silent> mo<CR> module<CR>endmodule<Up>
   autocmd Filetype systemverilog ino <buffer> <silent> be<CR> begin<CR>end<ESC>O
   autocmd Filetype systemverilog ino <buffer> <silent> cl<CR> class<CR>endclass<Up>
   autocmd Filetype systemverilog ino <buffer> <silent> fu<CR> function<CR>endfunction<Up>
   autocmd Filetype systemverilog ino <buffer> <silent> ta<CR> task<CR>endtask<Up>
   autocmd Filetype systemverilog ino <buffer> <silent> mo<CR> module<CR>endmodule<Up>
augroup END
"augroup nerdtree_open
"   autocmd!
"   autocmd VimEnter * NERDTree | wincmd p
"augroup END
autocmd BufNewFile,BufRead,BufEnter *.do    set syntax=tcsh
autocmd BufNewFile,BufRead,BufEnter *.V     set syntax=verilog
autocmd BufNewFile,BufRead,BufEnter files.f set syntax=off

"_let_options
let g:python3_host_prog = 'F:\@win\scoop\apps\python\current\python.exe'
let g:LanguageClient_loadSettings = 1
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:NERDTreeSortOrder = map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')

"_map_keys
nn ; :
ino <C-"> <C-Left><C-Right>
nn <C-"> <C-Left><C-Right>
vn <c-c> "+y
vn <c-x> "+x
map! <S-Insert>  <C-R>+
nn <c-S-s> :w<CR>
ino <c-S-s> <Esc>:w<CR>a
vn <c-S-s> <Esc>:w<CR>
nn <c-s> :wa<CR>
ino <c-s> <Esc>:wa<CR>
vn <c-s> <Esc>:wa<CR>
nn <C-6> <C-^>
nn <C--> <C-W>_
nn <C-=> <C-W>=
nn <C-k> <C-W>L
nn <C-Left>  <C-W><Left>
nn <C-Up>    <C-W><Up>
nn <C-Down>  <C-W><Down>
nn <C-Right> <C-W><Right>
nn <C-h> <C-W><Left>
nn <C-k> <C-W><Up>
nn <C-j> <C-W><Down>
nn <C-l> <C-W><Right>
nn gf <c-w>f<c-w>L
nn gF <c-w>gf
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O
tno <Esc> <C-\><C-n>
nn \z :setl fde=(getline(v:lnum)=~@/)?0:(getline(v:lnum)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?0:1 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
nn <F5> :call LanguageClient_contextMenu()<CR>
ino <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
ino <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

"_vim_plug
call plug#begin('~/.local/share/nvim/plugged')
  "_misc
  Plug 'ggandor/lightspeed.nvim'
  Plug 'ActivityWatch/aw-watcher-vim'
  Plug 'antoinemadec/FixCursorHold.nvim'
  Plug 'xolox/vim-session'
  Plug 'xolox/vim-misc'
  Plug 'junegunn/fzf', { 'do': 'pwsh install.ps1' }
  Plug 'junegunn/fzf.vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'scrooloose/syntastic'
  Plug 'Shougo/deoplete.nvim', {
          \'do': ':UpdateRemotePlugins'
          \}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'godlygeek/tabular'
  "Plug 'kevinhwang91/rnvimr'
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'pwsh install.ps1',
"    \ }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'fidian/hexmode'

  Plug 'neovim/nvim-lspconfig'
  "_Syntax
  Plug 'zigford/vim-powershell'
  Plug 'Raku/vim-raku'

  "_Folding
  Plug 'pierreglaser/folding-nvim'
" Plug 'tmhedberg/simpylfold'

  "_Buffers
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'chrisbra/NrrwRgn'
  Plug 'voldikss/vim-floaterm'

  "_file_manager
  Plug 'lambdalisue/fern.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'

  "_colorscheme
  Plug 'tomasiser/vim-code-dark'
call plug#end()

"_colorscheme
colorscheme codedark

"_lua
"packadd folding-nvim

"_lsp
lua << EOF
function on_attach_callback(client, bufnr)
  -- If you use completion-nvim/diagnostic-nvim, uncomment those two lines.
  -- require('diagnostic').on_attach()
  -- require('completion').on_attach()
  require('folding').on_attach()
end

require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.svls.setup{}
require'lspconfig'.perlls.setup{on_attach=on_attach_callback}
EOF
"let g:LanguageClient_serverCommands = {
"   \ 'rust'          : ['rust-analyzer'],
"   \ 'systemverilog' : ['svls'],
"   \ 'cpp'           : ['clangd', '-background-index'],
"   \ 'c'             : ['clangd', '-background-index'],
"   \ 'h'             : ['clangd', '-background-index'],
"   \ }