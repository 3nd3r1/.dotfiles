{ pkgs, settings, ... }: {

  home.file.".config/qtile".source = ./qtile;
}
