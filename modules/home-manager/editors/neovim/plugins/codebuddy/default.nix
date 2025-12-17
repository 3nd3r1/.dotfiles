{ settings, ... }:
let
  profileImports = {
    work = [ ];
    laptop = [ ./copilot.nix ];
    devenv = [ ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
