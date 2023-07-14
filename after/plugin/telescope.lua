local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader>h', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>j', builtin.jumplist, {})
vim.keymap.set('n', '<leader>rs', builtin.registers, {})
vim.keymap.set('n', '<leader>rg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})
vim.keymap.set('n', '<leader>k', builtin.keymaps, {})
vim.keymap.set('n', '<leader>lt', builtin.treesitter, {})

telescope.setup {
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = function(...)
          return actions.move_selection_next(...)
        end,
        ["<C-k>"] = function(...)
          return actions.move_selection_previous(...)
        end,
      }
    }
  }
}

telescope.load_extension('fzf')
