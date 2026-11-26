{
  pkgs,
  lib,
  settings,
  mkBrewBin,
  ...
}:
let
  isWork = settings.profile == "graff";
in
{
  home.packages = lib.optionals (!isWork) (
    with pkgs;
    [
      kubectl
      krew
      kubectx
      yq-go
    ]
  );

  programs = {
    k9s = {
      enable = true;
      package = if isWork then mkBrewBin "k9s" else pkgs.k9s;
    };

    zsh.initContent = ''
      export PATH="$HOME/.krew/bin:$PATH"
    '';
  };
}
