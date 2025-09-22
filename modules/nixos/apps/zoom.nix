{ pkgs, ... }:
{
  programs.zoom-us = {
    enable = true;
    package = pkgs.zoom-us;
  };
}
