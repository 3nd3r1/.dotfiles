{
  pkgs,
  lib,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = lib.optionals pkgs.stdenv.isLinux [
      "--enable-features=UseOzonePlatform,WaylandWindowDecorations,WaylandTextInputV3"
      "--ozone-platform=wayland"
    ];
  };
}
