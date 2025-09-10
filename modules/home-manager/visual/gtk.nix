{ inputs, settings, pkgs, ... }:
let
  themeDetails = import ("${inputs.self}/themes/${settings.theme}.nix") {
    inherit pkgs inputs;
  };
in {
  gtk = {
    enable = true;
    iconTheme = themeDetails.icons;
  };
}
