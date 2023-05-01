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
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<M-Space>'] = cmp.mapping.complete()
	}
})
