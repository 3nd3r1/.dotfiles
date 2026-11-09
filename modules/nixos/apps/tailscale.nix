{ settings, ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "client";
    extraSetFlags = [ "--operator=${settings.username}" ];
  };
}
