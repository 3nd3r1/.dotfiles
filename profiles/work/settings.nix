{ pkgs, inputs, ... }:
rec {
  profile = "work";
  system = "aarch64-darwin";

  hostname = "elx-5cg2183zp2";
  username = "eavinrl";
  timezone = "Europe/Helsinki";
  locale = "en_US.UTF-8";
  name = "3nd3r1";
  email = "ender.spam.guru@gmail.com";
  dotfilesDir = "/Users/${username}/dotfiles";

  theme = "pain";
  wallpaper = "${inputs.self}/assets/wallpapers/no-pain.png";

  shell = "zsh";
  shellPkg = pkgs.zsh;

  nixgl = false;

  wms = [ ];
  editors = [ "neovim" ];
  browsers = [ "brave" ];
  terminals = [ "kitty" ];

  preferredEditor = "nvim";
  preferredBrowser = "brave";
  preferredTerminal = "kitty";
  preferredFileManager = "finder";
}
