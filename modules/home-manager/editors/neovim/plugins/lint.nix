{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yamllint
  ];

  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        yaml = [ "yamllint" ];
      };
    };
  };

  programs.nixvim.autoCmd = [
    {
      event = [ "BufWritePost" ];
      callback.__raw = ''
        function()
          require("lint").try_lint()
        end
      '';
    }
  ];
}
