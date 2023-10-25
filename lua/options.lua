local options = {
  -- files 
  encoding = 'utf8',
  fileencoding = 'utf8',

  -- settings
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  numberwidth = 4,
  showcmd = true,
  history = 50,
  swapfile = false,
  mouse = "",
  cursorline = true,
  scrolloff = 10,

  -- ui
  laststatus = 2,
  ruler = true,
  termguicolors = true,

  -- splits
  splitbelow = true,
  splitright = true,

  -- tabs and spaces
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  list = true,
  listchars = 'tab:\\u279c\\u00b7,trail:·,nbsp:+,leadmultispace:·,space:·',

  -- search
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  hlsearch = true,
}

for k, v in pairs(options) do
	vim.o[k] = v
end

vim.opt.iskeyword:append("-")
