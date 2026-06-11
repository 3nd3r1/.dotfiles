{
  settings,
  pkgs,
  ...
}:
let
  profileBlocks = {
    laptop = {
      "melkki" = {
        HostName = "melkki.cs.helsinki.fi";
        User = "rviljami";
        IdentityFile = "~/.ssh/id_rviljami";
      };
    };
    work = {
      "github.palantir.build" = {
        HostName = "github.palantir.build";
        IdentityFile = "~/.ssh/id_vranta";
      };
      "lfs.palantir.build" = {
        HostName = "lfs.palantir.build";
        IdentityFile = "~/.ssh/id_vranta";
      };
    };
    devenv = {
      "github.com" = {
        HostName = "ssh.github.com";
        Port = 443;
        IdentityFile = "~/.ssh/id_3nd3r1";
      };
      "gitlab.rnd.gic.ericsson.se" = {
        HostName = "gitlab.rnd.gic.ericsson.se";
        User = "git";
        IdentityFile = "~/.ssh/id_eavinrl_gitlab";
      };
    };
  };
  blocks = {
    "github.com" = {
      IdentityFile = "~/.ssh/id_3nd3r1";
    };
  }
  // (profileBlocks.${settings.profile} or { });
in
{
  services.ssh-agent.enable = pkgs.stdenv.isLinux;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = blocks;
  };
}
