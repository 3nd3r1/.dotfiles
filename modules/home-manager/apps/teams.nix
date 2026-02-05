{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ teams-for-linux ];

  xdg.configFile."teams-for-linux/config.json".text = ''
    {
      "auth": {
        "intune": {
          "enabled": true,
          "user": "viljami.ranta@ericsson.com"
        }
      },
      "notificationMethod": "electron"
    }
  '';
}
