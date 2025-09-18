{ pkgs, inputs, ... }:
rec {
  profile = "work";

  hostname = "elx-5cg2183zp2"; # Hostname
  username = "eavinrl"; # Username
  timezone = "Europe/Helsinki"; # Select timezone
  locale = "en_US.UTF-8"; # Select locale
  name = "3nd3r1"; # Name (git config)
  email = "ender.spam.guru@gmail.com"; # Email (git config)
  dotfilesDir = "/home/${username}/dotfiles"; # Absolute path of the repo;

  theme = "pain";
  wallpaper = "${inputs.self}/assets/wallpapers/office.png";

  shell = "zsh";
  shellPkg = pkgs.zsh;

  wms = [ "hyprland" ];
  editors = [ "neovim" ];
  browsers = [ "brave" ];
  terminals = [ "kitty" ];

  preferredEditor = "nvim";
  preferredBrowser = "brave";
  preferredTerminal = "kitty";
  preferredFileManager = "nautilus";
}
