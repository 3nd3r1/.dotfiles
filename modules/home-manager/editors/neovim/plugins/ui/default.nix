{
  imports = [ ./lualine.nix ];

  programs.nixvim.plugins = {
    web-devicons.enable = true;
    notify = {
      enable = true;
      settings = {
        background_colour = "#000000";
      };
    };
    which-key.enable = true;
    alpha = {
      enable = true;
      theme = "startify";
    };
  };
}
