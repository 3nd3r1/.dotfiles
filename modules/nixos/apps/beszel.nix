{
  services.beszel.agent = {
    enable = true;
    environmentFile = "/etc/beszel-agent.env";
  };

  systemd.services.beszel-agent.unitConfig.ConditionPathExists = "/etc/beszel-agent.env";
}
