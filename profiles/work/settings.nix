{ inputs, ... }:
rec {
  profile = "work";
  system = "aarch64-darwin";

  hostname = "vranta179-mac";
  username = "vranta";
  timezone = "Europe/London";
  locale = "en_US.UTF-8";
  name = "3nd3r1";
  email = "ender.spam.guru@gmail.com";
  dotfilesDir = "/Users/${username}/dotfiles";

  theme = "pain";
  wallpaper = "${inputs.self}/assets/wallpapers/no-pain.png";

  shell = "zsh";
  shellPkg = null;

  nixgl = false;

  wms = [ ];
  editors = [ "neovim" ];
  browsers = [ ];
  terminals = [ ];

  preferredEditor = "nvim";
  preferredBrowser = "";
  preferredTerminal = "";
  preferredFileManager = "finder";
}
