require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

require("which-key").add({
	{ "<leader>pv", "<CMD>Oil<CR>", desc = "Open Oil" },
	{
		"<leader>pcd",
		function()
			local oil = require("oil")
			local cwd = oil.get_current_dir()
			if cwd == nil then
				print("Oil not open")
				return
			end
			vim.cmd.cd(cwd)
			print("Changed cwd to: " .. cwd)
		end,
		desc = "Open Oil",
	},
})
