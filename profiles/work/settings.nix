{ pkgs, inputs, ... }: rec {
  profile = "work";

  hostname = "elx-5cg2183zp2"; # Hostname
  username = "eavinrl"; # Username
  timezone = "Europe/Helsinki"; # Select timezone
  locale = "en_US.UTF-8"; # Select locale
  name = "3nd3r1"; # Name (git config)
  email = "ender.spam.guru@gmail.com"; # Email (git config)
  dotfilesDir = "/home/${username}/dotfiles-new"; # Absolute path of the repo;

  theme = "pain";

  shell = "zsh";
  shellPkg = pkgs.zsh;

  wms = [ "qtile" "hyprland" ];
  editors = [ "neovim-old" ];
  browsers = [ "brave" ];
  terminals = [ "gnome-terminal" ];

  preferredEditor = "nvim";
  preferredBrowser = "brave";
  preferredTerminal = "gnome-terminal";
}
