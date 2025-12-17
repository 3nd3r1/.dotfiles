{ settings, ... }:
let
  profileImports = {
    work = [ ./tabnine.nix ];
    laptop = [ ./copilot.nix ];
    devenv = [ ./tabnine.nix ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
