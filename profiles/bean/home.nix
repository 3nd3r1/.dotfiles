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
    "${homeManagerModulesPath}/apps/codex.nix"
    "${homeManagerModulesPath}/apps/claude-code.nix"
    "${homeManagerModulesPath}/apps/opencode.nix"
    "${homeManagerModulesPath}/apps/antigravity-cli.nix"
    "${homeManagerModulesPath}/apps/lanmouse.nix"
    "${homeManagerModulesPath}/apps/obsidian.nix"
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
    bruno
    uv
    unzip
    keymapp
    python3
    eduvpn-client
    remmina
    proton-vpn
    qbittorrent
    obs-studio
    tor-browser
    loupe
    usbutils
    prismlauncher
    jq
    zotero
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

  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu-next";
      gpu-context = "wayland";
    };
  };

  services.blueman-applet.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
