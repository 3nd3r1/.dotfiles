{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = "${inputs.self}/config/ags";

    extraPackages = with pkgs; [
    ];
  };
}
