function ColorMyPencils(color)
	color = color or "ayu"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#800080" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, 'Function', { fg = "#ff8000" })
	vim.api.nvim_set_hl(0, 'String', { fg = "#FFFFFF" })
	vim.api.nvim_set_hl(0, '@field', { fg = "#800080" })
	vim.api.nvim_set_hl(0, 'Title', { fg = "#800080" })
	vim.api.nvim_set_hl(0, 'FloatTitle', { fg = "#800080" })
end
ColorMyPencils()
