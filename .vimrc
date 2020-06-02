call plug#begin()

Plug 'tpope/vim-fugitive' "git stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} "install latest binary for fzf
Plug 'junegunn/fzf.vim' "fuzzy finder for vim
Plug 'alvan/vim-closetag' "html tag completion

call plug#end()

set number relativenumber "hybrid line number mode
set laststatus=0 "don't show file name
set showtabline=2 "always show tab section, even if only one is open
:hi TabLineFill ctermfg=Black "set the fill line to be same as background

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

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"
"tab complete first suggestion if none selected:
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>" 

"buffer split navigation
nnoremap <C-LEFT> <C-W><C-H> 
nnoremap <C-DOWN> <C-W><C-J> 
nnoremap <C-UP> <C-W><C-K> 
nnoremap <C-RIGHT> <C-W><C-L>

