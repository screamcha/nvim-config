local options = {
  encoding = 'utf8',
  fileencoding = 'utf8',

  number = true,
  relativenumber = true,
  numberwidth = 4,
  showcmd = true,
  history = 50,
  swapfile = false,
  mouse = "",

  laststatus = 2,
  ruler = true,

  splitbelow = true,
  splitright = true,

  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,

  incsearch = true,
  hlsearch = true,
}

for k, v in pairs(options) do
	vim.o[k] = v
end

