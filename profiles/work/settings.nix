{ pkgs, inputs, ... }: rec {
  profile = "work";

  hostname = "elx-5cg2183zp2"; # Hostname
  username = "eavinrl"; # Username
  timezone = "Europe/Helsinki"; # Select timezone
  locale = "en_US.UTF-8"; # Select locale
  name = "3nd3r1"; # Name (git config)
  email = "ender.spam.guru@gmail.com"; # Email (git config)
  dotfilesDir = "/home/${username}/dotfiles-new"; # Absolute path of the repo;

  shell = "zsh"; # See user/shells directory.
  shellPkg = pkgs.zsh;

  theme = "pain";
  themeDetails = import (../../. + "/themes/${theme}.nix") { inherit pkgs; };

  wms = [ "qtile" ]; # See user/wm/ and system/wm directories.
  editors = [ ]; # See user/editors directory.
  browsers = [ "brave" ]; # See user/browsers directory.
  preferredEditor = "nvim"; # Session variable $TERM.
  preferredBrowser = "brave"; # Session variable $BROWSER.
}
