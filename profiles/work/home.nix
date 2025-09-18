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
    "${homeManagerModulesPath}/apps/nixgl.nix"
    "${homeManagerModulesPath}/shells/${settings.shell}"
    "${homeManagerModulesPath}/visual"
  ]
  ++ (map (terminal: "${homeManagerModulesPath}/terminals/${terminal}.nix") settings.terminals)
  ++ (map (editor: "${homeManagerModulesPath}/editors/${editor}") settings.editors)
  ++ (map (wm: "${homeManagerModulesPath}/wm/${wm}") settings.wms)
  ++ (map (browser: "${homeManagerModulesPath}/browsers/${browser}.nix") settings.browsers);

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    shell = {
      enableZshIntegration = true;
    };
    sessionVariables = {
      EDITOR = settings.preferredEditor;
      BROWSER = settings.preferredBrowser;
    };
  };
  home.packages = with pkgs; [
    neofetch
    docker
    arandr
    blueman
  ];

  # Fix gdm overwriting path
  xdg.configFile."environment.d/envvars.conf".text = ''
    PATH="$HOME/.nix-profile/bin:$PATH"
  '';

  # Fix gtk
  targets.genericLinux.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
