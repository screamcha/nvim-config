local neoTree = require('neo-tree')

neoTree.setup({
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
    }
  },
  filesystem = {
    window = {
      fuzzy_finder_mappings = {
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },
  }
})
