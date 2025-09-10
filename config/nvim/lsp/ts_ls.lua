return {
	root_markers = { "package.json" },
	root_dir = function(fname)
		local util = require("lspconfig").util
		local root = util.root_pattern("package.json")(fname)
		-- If there deno.json and package.json, its deno project
		if root and not util.path.is_file(root .. "/deno.json") then
			return root
		end
		return nil
	end,
}
