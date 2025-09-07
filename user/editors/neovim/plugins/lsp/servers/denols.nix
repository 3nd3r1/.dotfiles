{
  programs.nixvim.plugins.lsp.servers.denols = {
    enable = true;
    settings = {
      root_markers = [ "deno.json" "deno.jsonc" ];
      root_dir.__raw = ''
        require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")
      '';
    };
  };
}
