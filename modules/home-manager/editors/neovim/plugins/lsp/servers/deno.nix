{
  programs.nixvim.plugins.lsp.servers.denols = {
    enable = true;
    autostart = false;
    rootMarkers = [
      "deno.json"
      "deno.jsonc"
    ];
    extraOptions = {
      single_file_support = false;
    };
  };
}
