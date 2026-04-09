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
    sha256 = "sha256-BnXozOQs5rHB29z7pcYor7M5/34YoLslZiNj+qNqMME=";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Material-Black-Plum/ $out/share/themes/
  '';

  meta = with lib; {
    description = "Material Black Plum BE Colors";
    homepage = "https://github.com/rtlewis1/GTK/tree/Material-Black-Colors-Desktop/Material-Black-Plum-BE";
  };
}
