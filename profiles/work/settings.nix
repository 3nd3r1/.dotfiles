{ inputs, ... }:
rec {
  profile = "work";
  system = "aarch64-darwin";

  hostname = "vranta179-mac";
  username = "vranta";
  timezone = "Europe/London";
  locale = "en_US.UTF-8";
  name = "Viljami Ranta";
  email = "vranta@palantir.com";
  dotfilesDir = "/Users/${username}/dotfiles";

  theme = "pain";
  wallpaper = "${inputs.self}/assets/wallpapers/no-pain.png";

  shell = "zsh";
  shellPkg = null;

  nixgl = false;

  wms = [ "aerospace" ];
  editors = [ "neovim" ];
  browsers = [ ];
  terminals = [ "kitty" ];

  preferredEditor = "nvim";
  preferredBrowser = "";
  preferredTerminal = "";
  preferredFileManager = "finder";
}
