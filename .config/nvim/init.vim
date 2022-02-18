set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" open menu but don't autocomplete until selected
set completeopt=menuone,noinsert

lua << EOF
-- nvim-cmp (completion engine) setup
local cmp = require "cmp"
cmp.setup({
  -- a snippet engine is soft required for completion; choice of vsnip is arbitrary
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- use vsnip for snippets
    end,
  },
  mapping = {
    -- up/down already work for controlling menu
    ['<Tab>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  },
  -- configure completion sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- use buffer as source for `/` searching
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- use buffer as source for cmdline
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- lsp setup
-- load additional completion capabilities from nvim_lsp
local nvim_lsp = require "lspconfig"

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o> ; not using this?
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.diagnostic.open_float(0, {scope="cursor"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gH', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-l>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F5>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {'tsserver', 'pyright', 'vimls', 'dartls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
      }
    }
end

-- flutter tools
require('flutter-tools').setup{
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities
  }
} -- default setup params

EOF


" up/down arrows to navigate through suggestions menu
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
" accept suggestion with Tab
let g:completion_confirm_key = ""
" if the suggestions window is open:
" and we've focused a suggestion
" complete that suggestion
" otherwise, close the menu and insert a tab normally
" otherwise just insert a tab normally
imap <expr> <Tab>  pumvisible() ? complete_info()["selected"] != "-1" ?
      \ "\<Plug>(completion_confirm_completion)"  : 
      \ "\<c-e>\<Tab>" :  
      \ "\<Tab>"
imap <silent> <c-p> <Plug>(completion_trigger)
nnoremap <silent> <F5> <cmd>lua vim.lsp.buf.code_action()<CR>

