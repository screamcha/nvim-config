local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local luasnip = require('luasnip')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
		['<C-n>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close()
	}
})
