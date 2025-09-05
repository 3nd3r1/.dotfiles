local builtin = require("telescope.builtin")

require("which-key").add({
	{
		"<leader>p",
		group = "Telescope",
	},
	{ "<leader>pf", builtin.find_files, desc = "Find files" },
	{ "<leader>pg", builtin.git_files, desc = "Find git files" },
	{ "<leader>pt", builtin.treesitter, desc = "Treesitter find" },
	{
		"<leader>ps",
		function()
			builtin.live_grep({ additional_args = { "--hidden" } })
		end,
		desc = "Live grep",
	},
})
