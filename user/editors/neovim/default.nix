{ config, lib, pkgs, settings, ... }: {

  imports = [
    ./plugins/ai.nix
    ./plugins/autocomplete.nix
    ./plugins/colorizer.nix
    ./plugins/format.nix
    ./plugins/git.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/markview.nix
    ./plugins/navigation.nix
    ./plugins/suda.nix
    ./plugins/telescope.nix
    ./plugins/ui.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    cargo
    gcc
    nodejs_24
    python3
    yaml-language-server
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
