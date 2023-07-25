local neoTree = require('neo-tree')

neoTree.setup({
  window = {
    mappings = {
      ["<space>"] = "none",
      ["l"] = "open",
      ["h"] = "close_node",
    }
  },
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    },
    window = {
      fuzzy_finder_mappings = {
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },
  }
})
