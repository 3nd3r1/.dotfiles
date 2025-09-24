{ lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "sf-pro-display-font";
  version = "local"; # Use appropriate version

  src = ../../assets/fonts/sf-pro-display;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find $src -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
    find $src -name "*.otf" -exec cp {} $out/share/fonts/truetype/ \;
  '';

  meta = with lib; {
    description = "SF Pro Display Font";
    platforms = platforms.all;
  };
}
