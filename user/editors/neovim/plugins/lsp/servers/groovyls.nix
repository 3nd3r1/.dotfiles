{
  programs.nixvim.plugins.lsp.servers.groovy = {
    enable = true;
    settings = {
      groovy = {
        jenkins = {
          enabled = true;
          sharedLibrariesPath = "";
        };
      };
    };
  };
}
