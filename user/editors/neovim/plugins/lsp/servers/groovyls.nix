{
  programs.nixvim.plugins.lsp.servers.groovyls = {
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
