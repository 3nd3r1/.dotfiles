-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Colorscheme
	-- use({
	--    'Shatur/neovim-ayu',
	--    as = 'ayu',
	--    config = function()
	--        vim.cmd('colorscheme ayu');
	--    end
	-- })

	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("rcarriga/nvim-notify")
	use("nvim-tree/nvim-web-devicons")
	use("lambdalisue/suda.vim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	use("f-person/git-blame.nvim")
	use("stevearc/oil.nvim")

	use("folke/which-key.nvim")

	use("OXY2DEV/markview.nvim")

	-- LSP STUFF -----------------------------------------------------------------------------------------------------
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})

	-- Core LSP plugins (no more lsp-zero!)
	use("mason-org/mason.nvim")
	use("mason-org/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use({ "towolf/vim-helm", ft = "helm" })

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("L3MON4D3/LuaSnip")
	use("onsails/lspkind.nvim")

	-- Linting
	use("mfussenegger/nvim-lint")
	use("rshkarin/mason-nvim-lint")

	-- Formatting
	use("stevearc/conform.nvim")

	-- AI assistance
	use("github/copilot.vim")
	use("Exafunction/windsurf.vim")
end)
