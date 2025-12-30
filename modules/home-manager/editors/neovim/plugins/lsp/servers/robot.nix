{
  config,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins.lsp.servers.robotframework_ls = {
    enable = true;
    package = pkgs.robotframework-lsp;
  };
}
