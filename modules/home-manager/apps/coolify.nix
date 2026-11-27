# coolify-cli: official Coolify API CLI (https://github.com/coollabsio/coolify-cli).
# Not in nixpkgs. Prebuilt static Go release tarball.
# Bump: change version and hashes (see checksums.txt on the release).
{ pkgs, ... }:
let
  version = "1.11.0";
  sources = {
    x86_64-linux = {
      arch = "linux_amd64";
      sha256 = "c64ed02675de97afa265adadef349f15bcedbd1e52a30a8be70e50d9c649a517";
    };
    aarch64-linux = {
      arch = "linux_arm64";
      sha256 = "120fa4d5878d4f7e982bcf615012836699e94662f72e5a10c6a0a634ce254c32";
    };
    x86_64-darwin = {
      arch = "darwin_amd64";
      sha256 = "95f4084aad96f06d9b4c57cfc98612b2805cce7106ea2a814e0d8fadad8f83ea";
    };
    aarch64-darwin = {
      arch = "darwin_arm64";
      sha256 = "4a3e4b8ec28d4f7e982bcf615012836699e94662f72e5a10c6a0a634ce254c32";
    };
  };
  source =
    sources.${pkgs.stdenv.hostPlatform.system}
      or (throw "coolify-cli: unsupported system ${pkgs.stdenv.hostPlatform.system}");

  coolify-cli = pkgs.stdenvNoCC.mkDerivation {
    pname = "coolify-cli";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/coollabsio/coolify-cli/releases/download/v${version}/coolify-cli_${version}_${source.arch}.tar.gz";
      inherit (source) sha256;
    };
    sourceRoot = ".";
    installPhase = ''
      install -Dm755 coolify $out/bin/coolify
    '';
    meta = {
      description = "Official CLI tool to interact with the Coolify API";
      homepage = "https://github.com/coollabsio/coolify-cli";
      mainProgram = "coolify";
      platforms = builtins.attrNames sources;
    };
  };
in
{
  home.packages = [ coolify-cli ];
}
