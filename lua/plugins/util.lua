return {
  {
    "christoomey/vim-tmux-navigator"
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    init = function()
      require("Comment").setup()
    end
  },
  {
    "tpope/vim-surround",
  },
  {
    "jiangmiao/auto-pairs",
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files" },
    }
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      require("which-key").setup()
    end,
  }
}
