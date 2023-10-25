return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    init = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = event.buf, desc = "Hover for details" })
          vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end,
            { buffer = event.buf, desc = "Go to definition" })
          vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end,
            { buffer = event.buf, desc = "Go to declaration" })
          vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end,
            { buffer = event.buf, desc = "Go to implementation" })
          vim.keymap.set("n", "<leader>gt", function() vim.lsp.buf.type_definition() end,
            { buffer = event.buf, desc = "Go to type definition" })
          vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = event.buf, desc = "Workspace symbol" })
          vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end,
            { buffer = event.buf, desc = "References" })
          vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { buffer = event.buf, desc = "Rename" })
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
            { buffer = event.buf, desc = "Code action" })
          vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end,
            { buffer = event.buf, desc = "Format file" })

          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = event.buf, desc = "Open diagnostics" })
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = event.buf, desc = "Go to previous diagnostic item" })
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = event.buf, desc = "Go to next diagnostic item" })
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
              globals = { "vim" }
            },
            telemetry = {
              enable = false
            }
          }
        }
      })
      lspconfig.tsserver.setup({})
      lspconfig.terraformls.setup({})
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "solargraph",
        "lua_ls",
        "tsserver",
        "terraformls",
      },
    },
  },
}
