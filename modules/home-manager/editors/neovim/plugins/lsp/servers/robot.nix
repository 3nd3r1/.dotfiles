_:
{
  programs.nixvim.plugins.lsp.servers.robotframework_ls = {
    enable = true;
    package = null;
    cmd = [ "robotframework_ls" ];
  };
}
