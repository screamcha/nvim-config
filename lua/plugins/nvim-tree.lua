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
      require("nvim-tree").setup {}
    end,
  },
}
