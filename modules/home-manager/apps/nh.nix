{ settings, ... }:
{
  programs.nh = {
    enable = true;
    flake = settings.dotfilesDir;
  };
}
