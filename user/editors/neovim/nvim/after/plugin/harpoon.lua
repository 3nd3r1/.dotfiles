local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("which-key").add({
	{ "<leader>h", group = "Harpoon" },
	{ "<leader>ha", mark.add_file, desc = "Add file to harpoon" },
	{ "<leader>he", ui.toggle_quick_menu, desc = "Open harpoon menu" },
	{
		"<leader>h1",
		function()
			ui.nav_file(1)
		end,
		desc = "Navigate to file 1 in harpoon",
	},
	{
		"<leader>h2",
		function()
			ui.nav_file(2)
		end,
		desc = "Navigate to file 2 in harpoon",
	},
	{
		"<leader>h3",
		function()
			ui.nav_file(3)
		end,
		desc = "Navigate to file 3 in harpoon",
	},
	{
		"<leader>h4",
		function()
			ui.nav_file(4)
		end,
		desc = "Navigate to file 4 in harpoon",
	},
})
