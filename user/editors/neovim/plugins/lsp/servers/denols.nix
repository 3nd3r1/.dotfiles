{
  programs.nixvim.plugins.lsp.servers.denols = {
    enable = true;
    extraOptions = {
      root_dir =
        ''require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")'';
    };
    rootMarkers = [ "deno.json" "deno.jsonc" ];
  };
}
