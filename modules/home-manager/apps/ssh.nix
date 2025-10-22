{ pkgs, settings, ... }:
let
  profileBlocks = {
    laptop = { };
    work = {
      "devenv" = {
        hostname = "node-100-77-161-117.rnd.gic.ericsson.se";
        user = "eavinrl";
        identityFile = "~/.ssh/id_eavinrl";
      };
      "devenvold" = {
        hostname = "node-100-77-161-117.rnd.gic.ericsson.se";
        user = "eavinrl";
        identityFile = "~/.ssh/id_eavinrl";
      };
    };
    devenv = {
    };
  };
  blocks = {
    "*" = {
      identityFile = "~/.ssh/id_3nd3r1";
    };
  }
  // (profileBlocks.${settings.profile} or { });
in
{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = blocks;
  };
}
