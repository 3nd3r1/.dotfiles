{
  settings,
  pkgs,
  ...
}:
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
      "github.palantir.build" = {
        hostname = "github.palantir.build";
        identityFile = "~/.ssh/id_vranta";
      };
      "lfs.palantir.build" = {
        hostname = "lfs.palantir.build";
        identityFile = "~/.ssh/id_vranta";
      };
    };
    devenv = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        identityFile = "~/.ssh/id_3nd3r1";
      };
      "gitlab.rnd.gic.ericsson.se" = {
        hostname = "gitlab.rnd.gic.ericsson.se";
        user = "git";
        identityFile = "~/.ssh/id_eavinrl_gitlab";
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
  services.ssh-agent.enable = pkgs.stdenv.isLinux;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = blocks;
  };
}
