{ pkgs, settings, lib, ... }:

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
    };
  };

  programs.lazygit = {
    enable = true;
    package = if isWork then pkgs.emptyDirectory else pkgs.lazygit;
  };
}
