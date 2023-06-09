local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,  -- displays file status (readonly status, modified status)
        path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {
      'lsp_progress',        -- from arkav/lualine-lsp-progress
    },
  },
}
