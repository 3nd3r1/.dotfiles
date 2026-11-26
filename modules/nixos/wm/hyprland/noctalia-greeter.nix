{
  settings,
  themeDetails,
  ...
}:
{
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordlessSyncUsers = [ settings.username ];
    cursorTheme = {
      inherit (themeDetails.cursor) package name;
    };
    settings = {
      cursor.size = themeDetails.cursor.size;
      keyboard.layout = "fi";
    };
  };
}
