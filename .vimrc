:set number
:set ruler
:syntax on
"set tabs to have 4 spaces"
:set ts=4

" indent when moving to the next line while writing code"
set autoindent

" expand tabs into spaces"      
:set expandtab

" when using the >> or << commands, shift lines by 4 spaces"
:set shiftwidth=4


" show the matching part of the pair for [] {} and ()"
set showmatch

" enable all Python syntax highlighting features"
let python_highlight_all = 1

:set ignorecase
:set incsearch
:set hlsearch

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
map <F5> <Esc>:w<CR>:!clear;python3 %<CR>

execute pathogen#infect()

filetype plugin indent on
syntax on

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


set laststatus=2

:highlight Normal ctermfg=white ctermbg=black
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
