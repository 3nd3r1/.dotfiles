{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    ripgrep
    cargo
    gcc
    nodejs_24
    python3
    yaml-language-server
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = "${inputs.self}/config/nvim";
    recursive = true;
  };
}
