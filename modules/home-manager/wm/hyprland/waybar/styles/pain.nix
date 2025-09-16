{ themeDetails, ... }:
let
  purple1 = "#800080";
  purple2 = "#6a046e";
  purple3 = "#500859";
  purple4 = "#3a0b47";
  purple5 = "#2e0d3d";
  purple6 = "#3a1337";

  orange1 = "#ff5200";
  orange2 = "#ff8000";
in
{
  programs.waybar.style = ''
    * {
      font-family: "${themeDetails.font.name}";
      font-size: ${toString (themeDetails.font.size + 5)}px;
    }

    .color-1 {
      color: ${purple1};
    }

    .color-2 {
      color: ${purple2};
    }

    .color-3 {
      color: ${purple3};
    }

    .color-4 {
      color: ${purple4};
    }

    .color-5 {
      color: ${purple5};
    }

    window#waybar {
      background: #292b2e;
      color: #fdf6e3;
    }

    #custom-right-arrow-dark,
    #custom-left-arrow-dark {
      color: #1a1a1a;
    }
    #custom-right-arrow-light,
    #custom-left-arrow-light {
      color: #292b2e;
      background: #1a1a1a;
    }

    /* just the logo */
    #custom-spotify {
      background: #1a1a1a;
      color: #04982c;
      padding: 5px 5px;
    }

    /* the info displayed by playerctl */
    #custom-mpris {
      background: #1a1a1a;
      color: #2aa198;
      padding: 5px 5px;
    }

    #workspaces,
    #clock.1,
    #clock.2,
    #clock.3,
    #pulseaudio,
    #language,
    #network,
    #window,
    #memory,
    #cpu,
    #battery,
    #disk,
    #tray {
      background: #1a1a1a;
    }

    #workspaces button {
      padding: 0 2px;
      color: #fdf6e3;
    }
    #workspaces button.active {
      color: #268bd2;
    }
    #workspaces button.focused {
      color: #268bd2;
    }
    #workspaces button:hover {
      box-shadow: inherit;
      text-shadow: inherit;
    }
    #workspaces button:hover {
      background: #1a1a1a;
      border: #1a1a1a;
      padding: 0 3px;
    }

    #pulseaudio {
      color: #268bd2;
    }
    #memory {
      color: #2aa198;
    }
    #cpu {
      color: #6c71c4;
    }
    #battery {
      color: #859900;
    }
    #disk {
      color: #b58900;
    }

    #clock,
    #pulseaudio,
    #memory,
    #cpu,
    #battery,
    #disk {
      padding: 0 10px;
    }

    #custom-quit {
      color: #f59809;
      background: #1a1a1a;
    }

    #custom-lock {
      color: #6f05e5;
      background: #1a1a1a;
    }

    #custom-reboot {
      color: #00aba3;
      background: #1a1a1a;
    }

    #custom-power {
      color: #ff1818;
      background: #1a1a1a;
    }

    #not-power {
      padding: 0 0px;
      padding-left: 10px;
    }

    #network {
      background: #1a1a1a;
      padding: 0px 15px;
    }

    #network.disabled {
      color: #aba8a8;
    }

    #network.disconnected {
      color: #aba8a8;
    }

    #network.ethernet {
      color: #2aa198;
    }

    #network.wifi {
      color: #268bd2;
    }

    #language {
      color: #b58900;
      background: #1a1a1a;
      border-radius: 0px;
      padding: 0px 5px;
    }

    #window {
      background: #1a1a1a;
      padding: 0px 0px;
    }
  '';
}
