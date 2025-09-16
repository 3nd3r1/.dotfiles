{
  themeDetails,
  ...
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "${themeDetails.wallpaper}"
      ];

      wallpaper = [
        ",${themeDetails.wallpaper}"
      ];
    };
  };
}
