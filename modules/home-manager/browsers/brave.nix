{
  settings,
  config,
  pkgs,
  ...
}:
let
  bravePkg =
    if settings.nixgl then
      (config.lib.nixGL.wrap (
        pkgs.writeShellScriptBin "brave" ''
          ${pkgs.brave}/bin/brave \
            --enable-features=UseOzonePlatform,WaylandWindowDecorations \
            --ozone-platform=wayland \
            "$@"''
      ))
    else
      (pkgs.brave);
in
{
  home.packages = with pkgs; [ bravePkg ];
}
