return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { 
        "<leader>fs", 
        function() 
          return require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) 
        end, 
        desc = "Telescope grep string" 
      },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope list buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
		},
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
	}
}