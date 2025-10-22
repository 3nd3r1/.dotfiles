{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "material-black-plum-suru-icons";
  version = "1.0.0"; # Use appropriate version

  src = fetchFromGitHub {
    owner = "rtlewis88";
    repo = "rtl88-Themes";
    rev = "material-black-COLORS";
    sha256 = "sha256-BUJMd6Ltq16/HqqDbB5VDGIRSzLivXxNYZPT9sd6oTI=";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Material-Black-Plum-Suru/ $out/share/icons/
  '';

  meta = with lib; {
    description = "Material Black Plum Suru Icons";
    homepage = "https://github.com/rtlewis88/rtl88-Themes/tree/material-black-COLORS";
  };
}
