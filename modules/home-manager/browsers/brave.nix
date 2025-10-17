{
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"

      # "--disable-features=WaylandTextInputV3"
      # "--enable-wayland-ime=false"

      "--password-store=basic"

      "--enable-features=WaylandWindowDecorations"
      "--gtk-version=4"
    ];
  };
}
