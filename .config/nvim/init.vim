call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
call plug#end()

colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light mode


" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:deoplete#enable_at_startup = 1

filetype plugin indent on
syntax on 
set relativenumber
set number
set incsearch
set ignorecase
set smartcase
set hlsearch
set tabstop=4
set shiftwidth=4
set nowrap
set cursorline
set cursorcolumn
set mouse=a
set guicursor=
set termguicolors

"map :t :terminal
map <F5> <Esc>:w<CR>:!clear;python3 %<CR>

