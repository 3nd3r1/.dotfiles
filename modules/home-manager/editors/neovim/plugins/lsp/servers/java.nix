{ pkgs, ... }:
{
  programs.nixvim.plugins.lsp.servers.jdtls = {
    enable = true;
    package = pkgs.jdt-language-server;
  };
}

