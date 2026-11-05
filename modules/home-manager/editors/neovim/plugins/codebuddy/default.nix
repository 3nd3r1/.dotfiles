{ settings, ... }:
let
  profileImports = {
    graff = [ ];
    bean = [ ./copilot.nix ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
