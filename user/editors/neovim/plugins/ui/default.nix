{
  imports = [ ./lualine.nix ];

  programs.nixvim.plugins = {
    nvim-web-icons.enable = true;
    alpha-nvim.enable = true;
    nvim-notify.enable = true;
    which-key-nvim.enable = true;
    trouble-nvim.enable = true;
  };
}
