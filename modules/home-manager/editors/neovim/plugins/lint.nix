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
}
