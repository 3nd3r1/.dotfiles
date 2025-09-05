{ ... }: {
  home.packages = with pkgs; [ qtile python3 ];

  home.file.".config/qtile".source = ./qtile;
}
