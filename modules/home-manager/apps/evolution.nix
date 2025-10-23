{ pkgs, ... }:
let
  evolution-wrapped = pkgs.writeShellScriptBin "evolution" ''
    exec GDK_BACKEND=x11 nonixgl /usr/bin/evolution "$@"
  '';
in
{
  home.packages = [
    evolution-wrapped
  ];
}
