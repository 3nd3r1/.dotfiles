{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "material-black-plum-icons";
  version = "1.0.0"; # Use appropriate version

  src = fetchFromGitHub {
    owner = "rtlewis1";
    repo = "GTK";
    branch = "Material-Black-Colors-Desktop";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Material-Black-Plum/ $out/share/icons/
  '';

  meta = with lib; {
    description = "Material Black Plum Icons";
    homepage = "https://github.com/rtlewis1/GTK/tree/Material-Black-Colors-Desktop";
  };
}
