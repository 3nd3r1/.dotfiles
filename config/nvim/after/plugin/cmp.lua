local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<Tab>"] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+Space to trigger completion menu
		["<C-c>"] = cmp.mapping.complete(),

		-- Navigate between completions
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.select }),
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.select }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, { { name = "buffer" } }),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			preset = "codicons",
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
