{ nixGL, pkgs, ... }:
let
  nixGLIntel = nixGL.packages.${pkgs.stdenv.hostPlatform.system}.nixGLIntel;

  # Wrapper for start-hyprland which expects 'nixGL' binary
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
{
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
