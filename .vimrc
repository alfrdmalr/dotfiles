call plug#begin()

Plug 'tpope/vim-fugitive' "git stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} "install latest binary for fzf
Plug 'junegunn/fzf.vim' "fuzzy finder for vim
Plug 'alvan/vim-closetag' "html tag completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-angular', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}

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

"netrw stuff
"start with banner collapsed
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"
"tab complete first suggestion if none selected:
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>" 

"buffer split navigation
nnoremap <C-LEFT> <C-W><C-H> 
nnoremap <C-DOWN> <C-W><C-J> 
nnoremap <C-UP> <C-W><C-K> 
nnoremap <C-RIGHT> <C-W><C-L>
"fuzzy find with control-p
nnoremap <C-P> :FZF<CR>
"ripgrep search from current dir
nnoremap <F8> :Rg<CR>
"toggle netrw directory tree
nnoremap <F4> :Lexplore<CR>

