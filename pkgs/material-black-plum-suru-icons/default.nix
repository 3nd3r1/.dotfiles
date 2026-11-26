{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "material-black-plum-suru-icons";
  version = "unstable-master";

  src = fetchFromGitHub {
    owner = "rtlewis88";
    repo = "rtl88-Themes";
    rev = "3864d851aac7f4e76cf23717aee104de234aef74";
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
