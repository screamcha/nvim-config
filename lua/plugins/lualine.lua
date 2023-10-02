return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "arkav/lualine-lsp-progress",
    },
    opts = {
      options = {
        icons_enabled = false,
        theme = "auto",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            file_status = true, -- readonly / modified etc.
            path = 1, -- 0 - just filename, 1 - relative path, 2 - absolute path
          },
        },
        lualine_x = {
          "lsp_progress",
        },
      },
    },
  }
}
