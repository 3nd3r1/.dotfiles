{ nixGL, pkgs, ... }:
let
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
  nixGL = {
    inherit (nixGL) packages;
    defaultWrapper = "mesa";
  };

  home.packages = [
    nonixgl
  ];
}
