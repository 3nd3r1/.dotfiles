{ pkgs, settings, lib, mkBrewBin, ... }:

let
  isWork = settings.profile == "work";
in
{
  programs.git = {
    enable = true;
    lfs.enable = isWork;
    signing = lib.mkIf isWork {
      key = "C6B031CAF50F5674";
      signByDefault = true;
    };
    settings = {
      user.name = settings.name;
      user.email = settings.email;
      core.editor = "nvim";
    } // lib.optionalAttrs isWork {
      url."git@github.palantir.build:".insteadOf = "https://github.palantir.build/";
    };
  };

  programs.lazygit = {
    enable = true;
    package = if isWork then mkBrewBin "lazygit" else pkgs.lazygit;
  };
}
