{ inputs, settings, pkgs, lib, ... }:
let
  themeDetails = import ("${inputs.self}/themes/${settings.theme}.nix") {
    inherit pkgs inputs;
  };
in {
  gtk = {
    enable = true;
    iconTheme = lib.mkForce themeDetails.icons;
    theme = lib.mkForce themeDetails.theme;
  };
}
