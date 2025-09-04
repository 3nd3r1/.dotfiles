{ config, lib, pkgs, settings, ... }: {
  home.packages = with pkgs; [
    neovim
    ripgrep
    python3
    cargo
    gcc
    nodejs_24
    yaml-language-server
  ];

  # Use the external dotfiles nvim config for quicker hacking
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${settings.dotfilesDir}/nvim";
}
