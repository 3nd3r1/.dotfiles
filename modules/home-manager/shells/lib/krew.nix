{
  pkgs,
  lib,
  settings,
  ...
}:

{
  home.packages = lib.optionals (settings.profile != "graff") (with pkgs; [ krew ]);

  programs.zsh.initContent = ''
    export PATH="$HOME/.krew/bin:$PATH"
  '';
}
