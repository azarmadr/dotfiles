"_let_options
let g:python3_host_prog = '/usr/bin/python3.9'
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_serverCommands = {
   \ 'rust'          : ['rust-analyzer'],
   \ 'systemverilog' : ['svls'],
   \ 'cpp'           : ['clangd', '-background-index'],
   \ 'c'             : ['clangd', '-background-index'],
   \ 'h'             : ['clangd', '-background-index'],
   \ }

"_vim_plug
call plug#begin('~/.local/share/nvim/plugged')
  "_misc
  Plug 'ggandor/lightspeed.nvim'
  Plug 'ActivityWatch/aw-watcher-vim'
  Plug 'antoinemadec/FixCursorHold.nvim'
  Plug 'xolox/vim-session'
  Plug 'xolox/vim-misc'
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
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'sh install.sh',
"     \ }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kevinhwang91/rnvimr'
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
"let g:airline_section_z = '%L-' . g:airline_section_z
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
