{ pkgs, ... }:
let
  evolution-wrapped = pkgs.writeShellScriptBin "evolution" ''
    GDK_BACKEND=x11 exec nonixgl /usr/bin/evolution "$@"
  '';
in
{
  home.packages = [
    evolution-wrapped
  ];
}
