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
      "--wayland-text-input-version=3"
      "--ozone-platform=wayland"
      "--enable-wayland-ime=true"
    ];
  };
}
