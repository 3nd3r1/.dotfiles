{ settings, ... }:

{
  programs.git = {
    enable = true;
    userName = settings.name;
    userEmail = settings.email;
    extraConfig.core.editor = "nvim";
  };

  programs.lazygit = {
    enable = true;
  };
}
