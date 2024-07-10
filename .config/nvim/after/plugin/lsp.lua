local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})

  vim.g.diagnostics_visible = true
  vim.diagnostic.enable(true)

  -- Enable inlay hints
  vim.lsp.inlay_hint.enable(true)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set(
  	"n",
  	"gD",
  	vim.lsp.buf.declaration,
  	vim.tbl_extend("force", bufopts, { desc = "✨lsp go to declaration" })
  )
  vim.keymap.set(
  	"n",
  	"gd",
  	vim.lsp.buf.definition,
  	vim.tbl_extend("force", bufopts, { desc = "✨lsp go to definition" })
  )
  vim.keymap.set(
  	"n",
  	"gt",
  	vim.lsp.buf.type_definition,
  	vim.tbl_extend("force", bufopts, { desc = "✨lsp go to type definition" })
  )
  vim.keymap.set(
  	"n",
  	"gi",
  	vim.lsp.buf.implementation,
  	vim.tbl_extend("force", bufopts, { desc = "✨lsp go to implementation" })
  )
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehaiorSelect}
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-u>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-d>'] = cmp.mapping.select_next_item(cmp_select),

    ['<C-Space>'] = cmp.mapping.complete(),

    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

