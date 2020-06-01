call plug#begin()

Plug 'tpope/vim-fugitive' "git stuff
Plug 'prabirshrestha/vim-lsp' "language server
Plug 'prabirshrestha/async.vim' "req for lsp
Plug 'prabirshrestha/asyncomplete.vim' "completion with lsp
Plug 'prabirshrestha/asyncomplete-lsp.vim' "completion with lsp
Plug 'mattn/vim-lsp-settings' "easy language server setup; run :LspInstallServer
Plug 'alvan/vim-closetag' "html tag completion

if executable('pyls')
	au User lsp_setup call lsp#register({
		 \ 'name': 'pyls',
		 \ 'cmd': {server_info ->['pyls']},
		 \ 'whitelist': ['python'],
		 \ })
endif

call plug#end()

set number relativenumber "hybrid line number mode

set tabstop=2 "tab chars -> 2 spaces
set softtabstop=2 "press tab -> insert 2 spaces
set shiftwidth=2
"set expandtab this turns tabs into spaces
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

autocmd! CompleteDone  * if pumvisible() == 0 | pclose | endif
