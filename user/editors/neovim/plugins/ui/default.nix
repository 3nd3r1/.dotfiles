{
  imports = [ ./lualine.nix ];

  programs.nixvim.plugins = {
    nvim-web-icons.enable = true;
    alpha.enable = true;
    nvim-notify.enable = true;
    which-key-nvim.enable = true;
    trouble-nvim.enable = true;
  };
}
