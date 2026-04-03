{
  themeDetails,
  lib,
  ...
}:
{
  gtk = {
    enable = true;
    iconTheme = lib.mkForce themeDetails.icons;
    theme = lib.mkForce themeDetails.theme;
    gtk4.theme = lib.mkForce themeDetails.theme;
  };
}
