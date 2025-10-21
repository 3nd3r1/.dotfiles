{ pkgs, ... }:
{
  home.packages = with pkgs; [
    typescript
  ];

  programs.nixvim.plugins.lsp.servers.ts_ls = {
    enable = true;
    rootMarkers = [ "package.json" ];
  };
}
