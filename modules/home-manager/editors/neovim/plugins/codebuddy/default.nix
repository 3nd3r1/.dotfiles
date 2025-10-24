{ settings, ... }:
let
  profileImports = {
    work = [ ./amazonq.nix ];
    laptop = [ ./copilot.nix ];
    devenv = [ ./amazonq.nix ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
