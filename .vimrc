" options specifying ONLY {branch: main} are to circumvent the old 'master' default branch name
call plug#begin()
Plug 'tpope/vim-fugitive' "git stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} "install latest binary for fzf
Plug 'junegunn/fzf.vim' "fuzzy finder for vim

Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim' "deprecated/archived
"consider nvim-cmp vs coq
"consider saga

Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim', {'branch': 'main'}

Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/cmp-cmdline', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip' 

Plug 'dart-lang/dart-vim-plugin' "dart syntax highlight
Plug 'leafgarland/typescript-vim' "ts syntax highlight
Plug 'peitalin/vim-jsx-typescript' "j/tsx syntax highlight

"Plug 'lervag/vimtex'
Plug 'dylanaraps/wal.vim'
"Plug 'mattn/emmet-vim'
"
" colorschemes
Plug 'http://github.com/joshdick/onedark.vim.git'
Plug 'http://github.com/rakr/vim-one.vim.git'

call plug#end()

set relativenumber "hybrid line number mode
set number " current line number instead of 0
set tabstop=2 "tab chars -> 2 spaces
set softtabstop=2 "press tab -> insert 2 spaces
set shiftwidth=2
set expandtab "this turns tabs into spaces
set autoindent
set smartindent

"edit files directly instead of in swap file
set backupcopy=yes

" when opening new vertical/horizontal splits, do so to the right/bottom of
" active buffer
set splitbelow
set splitright

set showmatch "highlight matching braces
syntax on
colorscheme wal "use wal theme as colorscheme
"colorscheme onedark

hi Comment cterm=italic

set textwidth=79
set foldmethod=manual "manual folding
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
set statusline+=%#RedrawDebugComposed#
set statusline+=\ %f\  
"right side
set statusline+=%=  
"file type
set statusline+=%#RedrawDebugComposed#
set statusline+=%y\  
"cur line / total lines
set statusline+=%#SpecialKey#
set statusline+=\ %l,%c\ \|\ %L

"netrw stuff
"start with banner collapsed
let g:netrw_banner = 0

"buffer split navigation
" using qmk navlayer (control/arrows)
nnoremap <C-LEFT> <C-W><C-H> 
nnoremap <C-DOWN> <C-W><C-J> 
nnoremap <C-UP> <C-W><C-K> 
nnoremap <C-RIGHT> <C-W><C-L>
tnoremap <C-LEFT> <C-\><C-N><C-W><C-H> 
tnoremap <C-DOWN> <C-\><C-N><C-W><C-J> 
tnoremap <C-UP> <C-\><C-N><C-W><C-K> 
tnoremap <C-RIGHT> <C-\><C-N><C-W><C-L>
" using alt + hjkl
nnoremap <A-h> <C-W><C-H> 
nnoremap <A-j> <C-W><C-J> 
nnoremap <A-k> <C-W><C-K> 
nnoremap <A-l> <C-W><C-L>
tnoremap <A-h> <C-W><C-H> 
tnoremap <A-j> <C-W><C-J> 
tnoremap <A-k> <C-W><C-K> 
tnoremap <A-l> <C-W><C-L>

"fuzzy find with control-p
nnoremap <C-P> :FZF<CR>
"ripgrep search from current dir
nnoremap <F8> :Rg<CR>
"buffer search
nnoremap <F7> :Buffers<CR>
"toggle netrw directory tree
nnoremap <F4> :Lexplore<CR>
"git fugitive window:
nnoremap <F12> :Git<CR> 
"apply suggestions
"nnoremap <F5> ???
"reload this file
nnoremap <F9> :so $MYVIMRC<CR>
"save
nnoremap <F6> :w<CR>
"crosshairs
nnoremap <F2> :set cuc! cul!<CR>
inoremap <F7> <C-X><C-O>
"open terminal in new window
nnoremap ;t :sp<CR>:term<CR>
"back to normal mode when editing in terminal mode
"Alt-Esc instead of Esc to support nested terminals :P
tnoremap <A-Esc> <C-\><C-N>
