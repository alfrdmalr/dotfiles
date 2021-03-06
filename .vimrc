call plug#begin()

Plug 'tpope/vim-fugitive' "git stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} "install latest binary for fzf
Plug 'junegunn/fzf.vim' "fuzzy finder for vim
Plug 'alvan/vim-closetag' "html tag completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} "completion
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'leafgarland/typescript-vim' "tsx syntax highlight
Plug 'peitalin/vim-jsx-typescript'
Plug 'dylanaraps/wal.vim'

call plug#end()

set number relativenumber "hybrid line number mode

set tabstop=2 "tab chars -> 2 spaces
set softtabstop=2 "press tab -> insert 2 spaces
set shiftwidth=2
set expandtab "this turns tabs into spaces
set autoindent
set smartindent

" when opening new vertical/horizontal splits, do so to the right/bottom of
" active buffer
set splitbelow
set splitright

set showmatch "highlight matching braces
syntax on
colorscheme wal "use wal theme as colorscheme

set textwidth=79
set foldmethod=indent "automatic folding based on indent
set foldnestmax=2 "limit one fold per fold

set incsearch "show results while searching
set ignorecase "case insensitive search by default
set smartcase "switch to sensitive search if capital letters present

"status line config (heavily inspired by George Onbo's config)
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatusLineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?''.l:branchname.' ':''
endfunction

set laststatus=2 "always show
set statusline=
"truncate from this point
set statusline+=%<
"show branch name if exists (max 20 chars)
set statusline+=%#SpecialKey#
set statusline+=%{StatusLineGit()}
"show filename (tail)
"set statusline+=%#SpecialKey#
"set statusline+=%t\  
"file name (from current dir)
set statusline+=%#RedrawDebugRecompose#
set statusline+=\ %f\  
"right side
set statusline+=%=  
"file type
set statusline+=%#RedrawDebugRecompose#
set statusline+=%y\  
"cur line / total lines
set statusline+=%#SpecialKey#
set statusline+=\ %l,%c\ \|\ %L

"netrw stuff
"start with banner collapsed
let g:netrw_banner = 0

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
nnoremap <F12> :Git 

