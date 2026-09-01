{ pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
  home.packages = with pkgs; [
    sway-contrib.grimshot
    slurp
    grim
    wl-clipboard
  ];
}
