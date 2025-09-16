{ themeDetails, ... }:
let
  black1 = "#000000";

  white1 = "#ffffff";

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

    window#waybar {
      background: ${black1};
    }

    /* The powerline */
    #custom-left-arrow-1 {
      background: ${black1};
      color: ${purple1};
    }
    #cpu {
      background: ${purple1};
    }
    #custom-left-arrow-2 {
      background: ${purple1};
      color: ${purple2};
    }
    #network {
      background: ${purple2};
    }
    #custom-left-arrow-3 {
      background: ${purple2};
      color: ${purple3};
    }
    #pulseaudio {
      background: ${purple3};
    }
    #custom-left-arrow-4 {
      background: ${purple3};
      color: ${purple4};
    }
    #battery {
      background: ${purple4};
    }
    #custom-left-arrow-5 {
      background: ${purple4};
      color: ${purple5};
    }
    #clock {
      background: ${purple5};
    }
    #custom-left-arrow-6 {
      background: ${purple5};
      color: ${black1};
    }

    #clock, #battery, #power, #pulseaudio, #network, #cpu {
      color: ${white1};
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
