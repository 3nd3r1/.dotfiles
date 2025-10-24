{ settings, ... }:
let
  profileImports = {
    work = [ ./windsurf-vim.nix ];
    laptop = [ ./copilot.nix ];
    devenv = [ ./amazonq.nix ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
