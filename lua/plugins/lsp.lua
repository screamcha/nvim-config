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
          local function opts(desc)
            return { desc = "LSP: " .. desc, buffer = event.buf, noremap = true, silent = true }
          end

          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Hover for details"))
          vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end,
            opts("Go to definition"))
          vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end,
            opts("Go to declaration"))
          vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end,
            opts("Go to implementation"))
          vim.keymap.set("n", "<leader>gt", function() vim.lsp.buf.type_definition() end,
            opts("Go to type definition"))
          vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end,
            opts("Workspace symbol"))
          vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end,
            opts("References"))
          vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename"))
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
            opts("Code action"))
          vim.keymap.set({ "n", "x" }, "<leader>f", function() vim.lsp.buf.format({ async = true }) end,
            opts("Format file"))

          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts("Open diagnostics"))
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts("Go to previous diagnostic item"))
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts("Go to next diagnostic item"))
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
      lspconfig.rust_analyzer.setup({})

      -- linters
      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
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
        "rust_analyzer",
        "eslint"
      },
    },
  },
}
