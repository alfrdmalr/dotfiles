call plug#begin()

Plug 'tpope/vim-fugitive' "git stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag' "html tag completion

call plug#end()

set number relativenumber "hybrid line number mode

set tabstop=2 "tab chars -> 2 spaces
set softtabstop=2 "press tab -> insert 2 spaces
set shiftwidth=2
set expandtab "this turns tabs into spaces
set autoindent
set smartindent

set showmatch "highlight matching braces
syntax on

set textwidth=79
set foldmethod=indent "automatic folding based on indent
set foldnestmax=1 "limit one fold per fold

set incsearch "show results while searching
set ignorecase "case insensitive search by default
set smartcase "switch to sensitive search if capital letters present

inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"
"tab complete first suggestion if none selected:
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>" 
