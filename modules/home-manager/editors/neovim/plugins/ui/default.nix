{
  imports = [ ./lualine.nix ];

  programs.nixvim.plugins = {
    web-devicons.enable = true;
    notify.enable = true;
    which-key.enable = true;
    alpha = {
      enable = true;
      theme = "startify";
    };
  };
}
