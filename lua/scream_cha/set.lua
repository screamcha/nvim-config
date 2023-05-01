local options = {
  breakindent = true,
	clipboard = 'unnamedplus',
	completeopt = 'menuone,noselect',
	confirm = true,
	cursorline = true,
	equalalways = true,
	expandtab = true,
	fileencoding = 'utf-8',
	hlsearch = false,
	ignorecase = true,
	incsearch = true,
	list = true,
	listchars = 'tab:\\u279c\\u00b7,trail:·,nbsp:+,leadmultispace:·,space:·',
	number = true,
	relativenumber = true,
	scrolloff = 10,
	shiftwidth = 2,
  showtabline = 2,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	tabstop = 2,
	termguicolors = true,
	updatetime = 50,
	writebackup = false,
}

for k, v in pairs(options) do
	vim.o[k] = v
end

