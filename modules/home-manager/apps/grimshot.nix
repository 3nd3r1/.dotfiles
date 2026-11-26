{ pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
  home.packages = with pkgs; [
    satty
    slurp
    grim
    wl-clipboard
  ];
}
