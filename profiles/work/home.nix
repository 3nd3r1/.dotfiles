{
  settings,
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
    "${homeManagerModulesPath}/apps/karabiner.nix"
    "${homeManagerModulesPath}/shells/${settings.shell}"
    "${homeManagerModulesPath}/visual"
  ]
  ++ (map (terminal: "${homeManagerModulesPath}/terminals/${terminal}.nix") settings.terminals)
  ++ (map (editor: "${homeManagerModulesPath}/editors/${editor}") settings.editors)
  ++ (map (wm: "${homeManagerModulesPath}/wm/${wm}") settings.wms)
  ++ (map (browser: "${homeManagerModulesPath}/browsers/${browser}.nix") settings.browsers);

  home = {
    inherit (settings) username;
    homeDirectory = "/Users/${settings.username}";
    sessionVariables = {
      EDITOR = settings.preferredEditor;
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
