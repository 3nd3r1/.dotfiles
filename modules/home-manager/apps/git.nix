{ settings, ... }:

{
  programs.git = {
    enable = true;
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
