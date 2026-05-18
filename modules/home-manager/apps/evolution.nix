{ pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.isLinux {
  home.packages = [
    (pkgs.writeShellScriptBin "evolution" ''
      GDK_BACKEND=x11 exec nonixgl /usr/bin/evolution "$@"
    '')
  ];
}
