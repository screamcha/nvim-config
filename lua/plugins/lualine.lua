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
            file_status = true,
            path = 1,
          },
        },
        lualine_x = {
          "lsp_progress",
        },
      },
    },
  },
}
