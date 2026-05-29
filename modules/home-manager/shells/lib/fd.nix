{ pkgs, lib, settings, ... }:

{
  home.packages = lib.optionals (settings.profile != "work") (with pkgs; [ fd ]);
}
