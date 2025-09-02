{ pkgs, ... }: {
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = { identityFile = "~/.ssh/id_3nd3r1"; };
  };
}
