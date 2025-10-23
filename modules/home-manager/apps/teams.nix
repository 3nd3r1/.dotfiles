{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ teams-for-linux ];

  xdg.configFile."teams-for-linux/config.json".text = ''
    {
      "ssoInTuneEnabled": true,
      "ssoInTuneAuthUser": "viljami.ranta@ericsson.com",
      "notificationMethod": "electron"
    }
  '';
}
