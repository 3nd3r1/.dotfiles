{
  programs.nixvim.plugins.lsp.servers.gopls = {
    enable = true;
    settings = {
      gopls = {
        analyses = {
          unusedparams = true;
        };
        staticcheck = true;
      };
    };
  };
}
