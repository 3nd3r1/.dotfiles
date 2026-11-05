{ settings, ... }:
let
  profileImports = {
    graff = [ ];
    bean = [ ./copilot.nix ];
    devenv = [ ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
