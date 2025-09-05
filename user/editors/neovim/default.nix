{ config, lib, pkgs, settings, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      ripgrep
      cargo
      gcc
      nodejs_24
      python3
      yaml-language-server
    ];
  };

  # Use the external dotfiles nvim config for quicker hacking
  home.file.".config/nvim".source = ./nvim;
}
