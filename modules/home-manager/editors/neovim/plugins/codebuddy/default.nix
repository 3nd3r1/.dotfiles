{ settings, ... }:
{
  imports =
    if settings.profile == "work" then
      [
        ./windsurf-vim.nix
      ]
    else
      [ ./copilot.nix ];
}
