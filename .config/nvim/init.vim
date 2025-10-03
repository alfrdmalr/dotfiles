set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" open menu but don't autocomplete until selected
set completeopt=menuone,noinsert

lua << EOF

-- used for nvim-cmp <> vsnip config
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- used for nvim-cmp <> vsnip config
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- nvim-cmp (completion engine) setup
local cmp = require "cmp"
cmp.setup({
  -- a snippet engine is soft required for completion; choice of vsnip is arbitrary
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- use vsnip for snippets
    end,
  },

  mapping = cmp.mapping.preset.insert({
    --["<Tab>"] = cmp.mapping(function(fallback)
      --[[
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if not cmp.visible() then
        fallback()
      else
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      end
    end, {"i","s","c",}),
    ]]

  ["<Tab>"] = cmp.mapping(function(fallback)
      -- confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      -- otherwise, jump to next snippet placeholder
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s", "c", }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

  }),

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
  mapping = cmp.mapping.preset.cmdline({
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if not cmp.visible() then
        fallback()
      else
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      end
    end, {"i","s","c",}),

    -- naive approach to achieve this behavior; there's probably a better, native way of navigating menu options via up/down arrows
    ["<Up>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      else
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      end
    end, {"i", "s", "c"}),

    ["<Down>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      else
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      end
    end, {"i", "s", "c"})

  }),

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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-l>', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F5>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {'tsserver', 'pyright', 'vimls', 'dartls', 'terraformls', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
      }
    }
end

local elm_attach = function(client)
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end
require('lspconfig').elmls.setup({
  on_attach = elm_attach;
})

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

