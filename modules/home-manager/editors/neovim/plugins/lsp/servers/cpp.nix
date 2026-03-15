{ pkgs, ... }:
{
  home.packages = [ pkgs.clang-tools ];

  programs.nixvim.plugins.lsp.servers.clangd.enable = true;
}
