{
  settings,
  pkgs,
  inputs,
  ...
}:
let
  homeManagerModulesPath = "${inputs.self}/modules/home-manager";
in
{
  imports = [
    "${homeManagerModulesPath}/apps/ssh.nix"
    "${homeManagerModulesPath}/apps/git.nix"
    "${homeManagerModulesPath}/apps/lanmouse.nix"
    "${homeManagerModulesPath}/shells/${settings.shell}"
    "${homeManagerModulesPath}/visual"
  ]
  ++ (map (terminal: "${homeManagerModulesPath}/terminals/${terminal}.nix") settings.terminals)
  ++ (map (editor: "${homeManagerModulesPath}/editors/${editor}") settings.editors)
  ++ (map (wm: "${homeManagerModulesPath}/wm/${wm}") settings.wms)
  ++ (map (browser: "${homeManagerModulesPath}/browsers/${browser}.nix") settings.browsers);

  home = {
    inherit (settings) username;
    homeDirectory = "/home/${settings.username}";
    sessionVariables = {
      EDITOR = settings.preferredEditor;
      BROWSER = settings.preferredBrowser;
    };
  };

  home.packages = with pkgs; [
    fastfetch
    docker
    arandr
    blueman
    telegram-desktop
    speedcrunch
    gnumake
    gh
    vesktop
    pulsemixer
    pavucontrol
    postman
    uv
    unzip
    keymapp
    python3
    claude-code
    eduvpn-client
    remmina
    proton-vpn
    qbittorrent
    vlc
    obs-studio
    tor-browser
    loupe
    usbutils
    prismlauncher
    jq
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "application/x-directory" = "thunar.desktop";

      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/bmp" = "org.gnome.Loupe.desktop";
      "image/tiff" = "org.gnome.Loupe.desktop";
      "image/svg+xml" = "org.gnome.Loupe.desktop";
      "image/avif" = "org.gnome.Loupe.desktop";
      "image/heic" = "org.gnome.Loupe.desktop";
      "image/x-icon" = "org.gnome.Loupe.desktop";
    };
  };

  services.blueman-applet.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "pnpm-10.29.2" ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
