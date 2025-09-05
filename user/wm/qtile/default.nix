{ pkgs, ... }: {
  home.packages = with pkgs; [ python313Packages.qtile python3 ];

  home.file.".config/qtile".source = ./qtile;
}
