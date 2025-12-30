{
  pkgs,
  ...
}:
{
  programs.nixvim.plugins.lsp.servers = {
    robotcode = {
      enable = true;
      package = pkgs.robotcode;
    };
  };
}
