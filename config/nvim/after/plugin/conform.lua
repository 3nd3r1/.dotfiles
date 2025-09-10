-- Formatter
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		robot = { "robotidy" },
		go = { "gofmt", "goimports" },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		bash = { "beautysh" },
		sh = { "beautysh" },
        nix = { "nixfmt" },
	},
	formatters = {
		dockfmt = {
			inherit = false,
			command = "/usr/local/bin/dockfmt",
			args = { "fmt", "$FILENAME" },
		},
		robotidy = {
			inherit = false,
			command = "robotidy",
			args = function()
				local fp = io.open(os.getenv("HOME") .. "/.robotidy.toml", "r")
				if fp ~= nil then
					io.close(fp)
					return { "--config", os.getenv("HOME") .. "/.robotidy.toml", "$FILENAME", "--overwrite" }
				else
					return { "$FILENAME", "--overwrite" }
				end
			end,
			range_args = function(self, ctx)
				local fp = io.open(os.getenv("HOME") .. "/.robotidy.toml", "r")
				if fp ~= nil then
					io.close(fp)
					return {
						"--startline",
						ctx.range["start"][1],
						"--endline",
						ctx.range["end"][1],
						"--config",
						os.getenv("HOME") .. "/.robotidy.toml",
						"$FILENAME",
						"--overwrite",
					}
				else
					return {
						"--startline",
						ctx.range["start"][1],
						"--endline",
						ctx.range["end"][1],
						"$FILENAME",
						"--overwrite",
					}
				end
			end,
			stdin = false,
		},
		deno_fmt = {
			command = "deno",
			args = { "fmt", "-" },
			cwd = function(_, ctx)
				return vim.fn.fnamemodify(ctx.filename, ":h")
			end,
		},
	},
})

require("which-key").add({
	{
		mode = "n",
		{
			"<leader>f",
			function()
				conform.format({
					lsp_format = "fallback",
				})
			end,
			desc = "Format code",
		},
	},
	{
		mode = "v",
		{
			"<leader>f",
			function()
				conform.format({
					lsp_format = "fallback",
				})
			end,
			desc = "Format code",
		},
	},
})
