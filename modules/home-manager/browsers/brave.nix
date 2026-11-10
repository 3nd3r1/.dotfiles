{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    # TODO: drop this pin and the nixpkgs-brave input once nixos-unstable has
    # brave back (https://github.com/NixOS/nixpkgs/pull/584534).
    package = inputs.nixpkgs-brave.legacyPackages.${pkgs.stdenv.hostPlatform.system}.brave;
    commandLineArgs = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      "--enable-features=UseOzonePlatform,WaylandWindowDecorations,WaylandTextInputV3"
      "--ozone-platform=wayland"
    ];
  };
}
