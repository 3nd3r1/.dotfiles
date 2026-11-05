{
  settings,
  pkgs,
  ...
}:
let
  profileBlocks = {
    bean = {
      "melkki" = {
        HostName = "melkki.cs.helsinki.fi";
        User = "rviljami";
        IdentityFile = "~/.ssh/id_rviljami";
      };
    };
    graff = {
      "github.palantir.build" = {
        HostName = "github.palantir.build";
        IdentityFile = "~/.ssh/id_vranta";
      };
      "lfs.palantir.build" = {
        HostName = "lfs.palantir.build";
        IdentityFile = "~/.ssh/id_vranta";
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
  services.ssh-agent.enable = pkgs.stdenv.hostPlatform.isLinux;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = blocks;
  };
}
