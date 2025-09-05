return {
	on_attach = function(client, bufnr)
		local filename = vim.api.nvim_buf_get_name(bufnr)
		if filename:match("charts/.+/templates/.+%.ya?ml$") then
			vim.defer_fn(function()
				vim.lsp.buf_detach_client(bufnr, client.id)
			end, 100)
		end
	end,
}
