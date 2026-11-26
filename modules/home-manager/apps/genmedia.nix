# genmedia: fal.ai's agent CLI (https://github.com/fal-ai-community/genmedia-cli).
# Not in nixpkgs. Prebuilt Bun binary, run through nix-ld. Don't strip or
# patchelf it: the JS payload sits at the end of the file.
# Bump: change version and hash (see checksums.txt on the release).
{ pkgs, ... }:
let
  version = "0.7.1";
  genmedia = pkgs.stdenvNoCC.mkDerivation {
    pname = "genmedia";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/fal-ai-community/genmedia-cli/releases/download/v${version}/genmedia-linux-x64";
      sha256 = "d7c0b01fa2b67e0266cea19083073435221b138b0799c6e051e4fa8bf521c8f6";
    };
    nativeBuildInputs = [ pkgs.makeWrapper ];
    dontUnpack = true;
    dontStrip = true;
    dontPatchELF = true;
    installPhase = ''
      install -Dm755 $src $out/libexec/genmedia
      makeWrapper $out/libexec/genmedia $out/bin/genmedia \
        --set GENMEDIA_NO_UPDATE 1
    '';
    meta.platforms = [ "x86_64-linux" ];
  };
in
{
  home.packages = [ genmedia ];
}
