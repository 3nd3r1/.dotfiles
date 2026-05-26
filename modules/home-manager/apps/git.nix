{ settings, lib, ... }:

let
  isWork = settings.profile == "work";
in
{
  programs.git = {
    enable = true;
    lfs.enable = isWork;
    signing = lib.mkIf isWork {
      key = "F964ED111357DE83";
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
  };
}
