{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "material-black-plum-be-colors";
  version = "unstable-master";

  src = fetchFromGitHub {
    owner = "rtlewis1";
    repo = "GTK";
    rev = "Material-Black-Colors-Desktop";
    sha256 = "sha256-8AiMTAsmBdQJD9C4d/Y3eO+S7Fqz4rzYPLvxtCznYtE=";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Material-Black-Plum-BE/ $out/share/themes/
  '';

  meta = with lib; {
    description = "Material Black Plum BE Colors";
    homepage = "https://github.com/rtlewis1/GTK/tree/Material-Black-Colors-Desktop/Material-Black-Plum-BE";
  };
}
