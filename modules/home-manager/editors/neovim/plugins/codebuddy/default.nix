{ settings, ... }:
let
  profileImports = {
    work = [ ./copilot.nix ];
    laptop = [ ./copilot.nix ];
    devenv = [ ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
