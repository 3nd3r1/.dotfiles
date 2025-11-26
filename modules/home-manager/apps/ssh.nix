{ pkgs, settings, ... }:
let
  profileBlocks = {
    laptop = {
      "melkki" = {
        hostname = "melkki.cs.helsinki.fi";
        user = "rviljami";
        identityFile = "~/.ssh/id_rviljami";
      };
    };
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
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        identityFile = "~/.ssh/id_3nd3r1";
      };
    };
  };
  blocks = {
    "github.com" = {
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
