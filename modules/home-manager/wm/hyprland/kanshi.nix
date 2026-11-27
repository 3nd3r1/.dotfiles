{
  config,
  pkgs,
  ...
}:
let
  displayLayout = pkgs.writeShellApplication {
    name = "display-layout";
    runtimeInputs = [
      config.services.kanshi.package
      pkgs.noctalia
    ];
    text = ''
      choice=$(printf '%s\n' \
        "External only" \
        "Extend" \
        "Laptop only" | noctalia dmenu -p "Display") || exit 0

      case "$choice" in
        "External only") kanshictl switch docked ;;
        "Extend") kanshictl switch dual ;;
        "Laptop only") kanshictl switch laptop-only || kanshictl switch undocked ;;
      esac
    '';
  };
in
{
  home.packages = [ displayLayout ];

  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [
      {
        profile = {
          name = "undocked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              position = "0,0";
              scale = 1.0;
            }
          ];
        };
      }
      {
        profile = {
          name = "docked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "*";
              status = "enable";
              position = "0,0";
              scale = 1.0;
            }
          ];
        };
      }
      {
        profile = {
          name = "dual";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              position = "0,0";
              scale = 1.0;
            }
            {
              criteria = "*";
              status = "enable";
              position = "1920,0";
              scale = 1.0;
            }
          ];
        };
      }
      {
        profile = {
          name = "laptop-only";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              position = "0,0";
              scale = 1.0;
            }
            {
              criteria = "*";
              status = "disable";
            }
          ];
        };
      }
    ];
  };
}
