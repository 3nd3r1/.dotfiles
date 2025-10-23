{
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform,WaylandWindowDecorations,WaylandTextInputV3"
      "--ozone-platform=wayland"
    ];
  };
}
