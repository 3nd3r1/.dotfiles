{
  programs.nixvim.plugins.lsp.servers.groovyls = {
    enable = true;
    package = null;
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
