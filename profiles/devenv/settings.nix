{ pkgs, inputs, ... }:
rec {
  profile = "devenv";

  hostname = "node-100-77-161-117";
  username = "eavinrl"
  timezone = "Europe/Helsinki";
  locale = "en_US.UTF-8";
  name = "Viljami Ranta";
  email = "viljami.ranta@ericsson.com";
  dotfilesDir = "/home/${username}/dotfiles-new";

  theme = "pain";
  wallpaper = "${inputs.self}/assets/wallpapers/office.png";

  shell = "zsh";
  shellPkg = pkgs.zsh;

  nixgl = false; # Enable nixGL

  wms = [ ];
  editors = [ "neovim" ];
  browsers = [ ];
  terminals = [ ];

  preferredEditor = "nvim";
  preferredBrowser = "brave";
  preferredTerminal = "gnome-terminal";
  preferredFileManager = "nautilus";
}
