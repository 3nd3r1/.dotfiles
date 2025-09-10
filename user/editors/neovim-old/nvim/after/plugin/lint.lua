require("lint").linters_by_ft = {
	python = { "pylint" },
	yaml = { "yamllint" },
}
require("mason-nvim-lint").setup()

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
