{ nixGL, pkgs, lib, ... }:
let
  inherit (nixGL.packages.${pkgs.stdenv.hostPlatform.system}) nixGLIntel;

  nixGLWrapper = pkgs.writeShellScriptBin "nixGL" ''
    exec ${nixGLIntel}/bin/nixGLIntel "$@"
  '';

  nonixgl = pkgs.writeShellScriptBin "nonixgl" ''
    exec env \
      -u LD_LIBRARY_PATH \
      -u LIBGL_DRIVERS_PATH \
      -u LIBVA_DRIVERS_PATH \
      -u __EGL_VENDOR_LIBRARY_FILENAMES \
      -u GBM_BACKENDS_PATH \
      "$@"
  '';
in
lib.mkIf pkgs.stdenv.isLinux {
  targets.genericLinux.nixGL = {
    inherit (nixGL) packages;
    defaultWrapper = "mesa";
  };

  home.packages = [
    nonixgl
    nixGLIntel
    nixGLWrapper
  ];
}
