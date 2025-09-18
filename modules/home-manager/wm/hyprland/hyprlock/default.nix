{
  settings,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          path = settings.wallpaper;
          blur_passes = 3;
          blur_size = 8;
        }
      ];
    };
  };
}
