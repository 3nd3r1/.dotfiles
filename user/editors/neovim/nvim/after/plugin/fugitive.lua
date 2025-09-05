require("which-key").add({
	{
		"<leader>g",
		group = "Git",
	},
	{
		"<leader>gs",
		function()
			vim.cmd.Git()
		end,
		desc = "Open fugitive",
	},
})

local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = Fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		require("which-key").add({
			{
				"<leader>gP",
				function()
					vim.cmd.Git("push")
				end,
				desc = "Push",
			},
			{
				"<leader>gp",
				function()
					vim.cmd.Git("pull --rebase")
				end,
				desc = "Pull rebase",
			},
			{
				"<leader>gt",
				function()
					vim.cmd.Git("push -u origin ")
				end,
				desc = "Push to origin",
			},
		})
	end,
})
