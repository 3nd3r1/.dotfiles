{ pkgs, settings, ... }:
{

  imports = [
    ./options.nix
    ./keymaps.nix

    ./plugins/ui
    ./plugins/navigation
    ./plugins/lsp
    ./plugins/codebuddy
    ./plugins/autocomplete.nix
    ./plugins/colorizer.nix
    ./plugins/format.nix
    ./plugins/git.nix
    ./plugins/lint.nix
    ./plugins/markview.nix
    ./plugins/suda.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix

    ./colorscheme/${settings.theme}.nix
  ];

  home.packages =
    pkgs.lib.optionals (settings.profile != "work") (with pkgs; [ ripgrep ])
    ++ pkgs.lib.optionals pkgs.stdenv.isLinux (with pkgs; [
      xclip
      wl-clipboard
    ]);

  programs.nixvim = {
    enable = true;
    package = if settings.profile == "work" then pkgs.emptyDirectory else pkgs.neovim-unwrapped;
    wrapRc = settings.profile != "work";
    viAlias = true;
    vimAlias = true;
    nixpkgs.config = {
      allowUnfree = true;
    };
  };
}
