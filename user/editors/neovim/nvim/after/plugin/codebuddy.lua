-- Set Codium api
vim.cmd([[let g:codeium_server_config = {
  \'portal_url': 'https://codingbuddy.onprem.gic.ericsson.se',
  \'api_url': 'https://codingbuddy.onprem.gic.ericsson.se/_route/api_server' }
]])

-- Set auto complete to space
vim.keymap.set("i", "<C-Space>", function()
	if vim.g.codeium_enabled == 0 then
		return vim.fn["copilot#Accept"]()
	else
		return vim.fn["codeium#Accept"]()
	end
end, {
	expr = true,
	replace_keycodes = false,
	desc = "Accept Codebuddy completion",
})

-- Disable default binding
vim.g.copilot_no_tab_map = true
vim.g.codeium_disable_bindings = 1

-- Enable codium by default
vim.g.copilot_enabled = 0
vim.g.codeium_enabled = 1

-- Add keybindings
require("which-key").add({
	mode = { "n" },
	silent = true,
	{ "<leader>c", group = "Codingbuddy" },
	{
		"<leader>cc",
		function()
			vim.fn["codeium#Chat"]()
		end,
		desc = "Chat with Codeium",
	},
	{
		"<leader>c1",
		function()
			vim.g.copilot_enabled = not vim.g.copilot_enabled
			if vim.g.copilot_enabled then
				vim.g.codeium_enabled = 0
			end
		end,
		desc = "Toggle Copilot",
	},
	{
		"<leader>c2",
		function()
			vim.g.codeium_enabled = not vim.g.codeium_enabled
			if vim.g.codeium_enabled then
				vim.g.copilot_enabled = 0
			end
		end,
		desc = "Toggle Codeium",
	},
})
