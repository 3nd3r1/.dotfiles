pkgs:
let
  brewPrefix = if pkgs.stdenv.hostPlatform.isAarch64 then "/opt/homebrew" else "/usr/local";
in
name:
pkgs.runCommand "${name}-brew" { meta.mainProgram = name; } ''
  mkdir -p $out/bin
  ln -s ${brewPrefix}/bin/${name} $out/bin/${name}
''
