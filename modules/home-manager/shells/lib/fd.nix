{
  pkgs,
  lib,
  settings,
  ...
}:

{
  home.packages = lib.optionals (settings.profile != "graff") (with pkgs; [ fd ]);
}
