{
  settings,
  ...
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2;

      preload = [
        "${settings.wallpaper}"
      ];

      wallpaper = {
        monitor = "";
        path = "${settings.wallpaper}";
        fit_mode = "cover";
      };
    };
  };
}
