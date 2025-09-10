{ config, lib, pkgs, settings, ... }: {

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

  home.file.".config/nvim".source = ./nvim;
}
