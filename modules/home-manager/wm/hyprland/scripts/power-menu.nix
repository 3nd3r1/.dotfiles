{ pkgs, ... }:
let
  power-menu = pkgs.writeShellScriptBin "power-menu" ''
    # Power menu options
    options="⏻ Shutdown\n⏾ Reboot\n⇠ Logout\n󰒲 Suspend\n Lock"

    # Show rofi menu and get choice
    chosen="$(echo -e "$options" | ${pkgs.rofi}/bin/rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 300px;} listview {lines: 5;}')"

    # Execute based on choice
    case $chosen in
        "⏻ Shutdown")
            ${pkgs.systemd}/bin/systemctl poweroff
            ;;
        "⏾ Reboot")
            ${pkgs.systemd}/bin/systemctl reboot
            ;;
        "⇠ Logout")
            ${pkgs.systemd}/bin/loginctl terminate-user $USER
            ;;
        "󰒲 Suspend")
            ${pkgs.systemd}/bin/systemctl suspend
            ;;
        " Lock")
            ${pkgs.hyprlock}/bin/hyprlock
            ;;
    esac
  '';
in
{
  home.packages = [ power-menu ];
}
