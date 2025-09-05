require("mason").setup({})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local bufnr = ev.buf

		-- Disable semantic tokens
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end

		-- Setup which-key LSP mappings
		require("which-key").add({
			buffer = bufnr,
			{ "<leader>l", group = "LSP" },
			{ "<leader>K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show hover information" },
			{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
			{ "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to declaration" },
			{ "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Go to implementation" },
			{ "<leader>lo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Go to type definition" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Show references" },
			{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Show signature help" },
			{ "<leader><F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
			{ "<leader><F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
			{ "<leader>lx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		})
	end,
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ts_ls",
		"html",
		"yamlls",
		"helm_ls",
		"bashls",
		"gopls",
	},
})
