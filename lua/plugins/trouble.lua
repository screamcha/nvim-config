return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<F10>", "<cmd>:TroubleToggle<CR>", desc = "Toggle Trouble" },
    },
    opts = {
      auto_open = false,
      auto_close = true,
    },
  },
}
