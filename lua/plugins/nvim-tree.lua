return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<F12>", "<cmd>:NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    config = function()
      require("nvim-tree").setup {
        update_focused_file = {
          enable = true,
        },
        auto_close = { enable = true },
        diagnostics = { enable = true },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set("n", "l", api.node.open.edit, opts("Open folder or file"))
          vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close directory"))
        end,
      }
    end,
  },
}
