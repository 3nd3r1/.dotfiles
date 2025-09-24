{ lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "steelfish-outline-regular-font";
  version = "local"; # Use appropriate version

  src = ../../assets/fonts/steelfish-outline-regular;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find $src -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
    find $src -name "*.otf" -exec cp {} $out/share/fonts/truetype/ \;
  '';

  meta = with lib; {
    description = "Steelfish Outline Regular Font";
    platforms = platforms.all;
  };
}
