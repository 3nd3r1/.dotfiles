return {
	root_markers = { "deno.json", "deno.jsonc" },
	root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
}
