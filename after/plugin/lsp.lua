local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require 'mason'.setup()
require 'mason-lspconfig'.setup {
  ensure_installed = {
    -- language servers
    'solargraph',
    'lua_ls',
    'tsserver'
  }
}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<leader>gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', '<leader>gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)

    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
  end
})

vim.diagnostic.config({
  virtual_test = true
})

lspconfig.solargraph.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      telemetry = {
        enable = false
      }
    }
  }
})
lspconfig.tsserver.setup({})
