{ config, lib, pkgs, settings, ... }: {

  imports = [
    ./options.nix
    ./keymaps.nix

    ./plugins/ui
    ./plugins/navigation
    ./plugins/lsp
    ./plugins/codebuddy.nix
    ./plugins/autocomplete.nix
    ./plugins/colorizer.nix
    ./plugins/format.nix
    ./plugins/git.nix
    ./plugins/lint.nix
    ./plugins/markview.nix
    ./plugins/suda.nix
    ./plugins/telescope.nix

    ./colorscheme/${settings.theme}.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    xclip
    wl-clipboard
    cargo
    gcc
    nodejs_24
    python3
    yaml-language-server
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.config = {
      allowUnfree = true;
    };
  };
}
