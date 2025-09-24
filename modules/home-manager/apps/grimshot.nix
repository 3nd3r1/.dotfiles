{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sway-contrib.grimshot
    slurp
    grim
    wl-clipboard
  ];
}
