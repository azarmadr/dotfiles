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
so ~/.config/nvim/fu.vim
so ~/.config/nvim/coc-fu.vim
so ~/.config/nvim/rnvimr.vim

"_auto_commands
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END
autocmd BufNewFile,BufRead          Makefile set noexpandtab
autocmd BufNewFile,BufRead,BufEnter *.do     set syntax=tcsh
autocmd BufNewFile,BufRead,BufEnter *.V      set syntax=verilog
autocmd BufNewFile,BufRead,BufEnter files.f  set syntax=off

"_map_keys
map silent <S-Insert> "+p
imap silent <S-Insert> "+gpa
map! <C-S-Insert> <C-R>+
vnoremap <c-c> "+y
vnoremap <c-x> "+x
nnoremap <c-S-s> :w<CR>
inoremap <c-S-s> <Esc>:w<CR>a
vnoremap <c-S-s> <Esc>:w<CR>
nnoremap <c-s> :wa<CR>
inoremap <c-s> <Esc>:wa<CR>
vnoremap <c-s> <Esc>:wa<CR>
nnoremap <C-6> <C-^>
nnoremap <C--> <C-W>_
nnoremap <C-=> <C-W>=
nnoremap <C-k> <C-W>L
nnoremap <C-Left>  <C-W><Left>
nnoremap <C-Up>    <C-W><Up>
nnoremap <C-Down>  <C-W><Down>
nnoremap <C-Right> <C-W><Right>
nnoremap <C-h> <C-W><Left>
nnoremap <C-k> <C-W><Up>
nnoremap <C-j> <C-W><Down>
nnoremap <C-l> <C-W><Right>
nnoremap gf <c-w>f<c-w>L
nnoremap gF <c-w>gf
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
tnoremap <Esc> <C-\><C-n>
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?0:1 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"_vim_plug
call plug#begin('~/.local/share/nvim/plugged')
   Plug 'tomasiser/vim-code-dark'
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   Plug 'junegunn/fzf.vim'
   Plug 'davidhalter/jedi-vim'
   Plug 'scrooloose/syntastic'
   Plug 'Shougo/deoplete.nvim', {
            \'do': ':UpdateRemotePlugins'
            \}
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'godlygeek/tabular'
   Plug 'autozimu/LanguageClient-neovim', {
       \ 'branch': 'next',
       \ 'do': 'sh install.sh',
       \ }
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'mhinz/vim-signify'
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-rhubarb'
   Plug 'junegunn/gv.vim'
   Plug 'xolox/vim-session'
   Plug 'xolox/vim-misc'
   Plug 'ryanoasis/vim-devicons'
   Plug 'kevinhwang91/rnvimr'
call plug#end()

"_colorscheme
colorscheme codedark
