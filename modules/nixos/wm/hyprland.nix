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
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}
