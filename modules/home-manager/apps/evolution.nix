{ pkgs, ... }:
let
  evolution-wrapped = pkgs.writeShellScriptBin "evolution" ''
    exec nonixgl /usr/bin/evolution "$@"
  '';
in
{
  home.packages = [
    evolution-wrapped
  ];
}
