{
  pkgs,
  lib,
  settings,
  ...
}:

{
  home.packages = lib.optionals (settings.profile != "graff") (
    with pkgs;
    [
      kubectl
      krew
    ]
  );

  programs.zsh.initContent = ''
    export PATH="$HOME/.krew/bin:$PATH"
  '';
}
