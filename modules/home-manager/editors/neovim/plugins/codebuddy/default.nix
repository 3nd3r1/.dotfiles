{ settings, ... }:
let
  profileImports = {
    work = [ ./windsurf-vim.nix ];
    laptop = [ ./copilot.nix ];
    devenv = [ ./windsurf-vim.nix ];
  };
in
{
  imports = profileImports.${settings.profile} or [ ];
}
