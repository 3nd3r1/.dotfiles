{ inputs, config, lib, settings, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprcursor rose-pine-hyprcursor ];
}
