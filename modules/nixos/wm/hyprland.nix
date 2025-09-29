{
  inputs,
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wayland
    wl-clipboard
    xdg-utils
  ];

  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "fi";
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Add systemd service override to disable console output
  systemd.services.greetd = {
    serviceConfig = {
      # Disable systemd status messages on console before greetd starts
      ExecStartPre = "${pkgs.coreutils}/bin/kill -s RTMIN+21 1";
      # Re-enable them after greetd stops
      ExecStopPost = "${pkgs.coreutils}/bin/kill -s RTMIN+20 1";
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };
}
