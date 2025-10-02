{
  config,
  themeDetails,
  pkgs,
  ...
}:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "overlay";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "notifications"
      ];

      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
      };
    };

    style = ''
      * {
        font-family: "${themeDetails.font.name}";
        font-size: ${toString themeDetails.font.size}px;
      }

      .notification-row {
        outline: none;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .notification {
        border-radius: ${toString themeDetails.rounding}px;
        margin: 6px 12px;
        box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
          0 2px 6px 2px rgba(0, 0, 0, 0.3);
        padding: 0;
      }

      .notification-content {
        background: transparent;
        padding: 6px;
        border-radius: ${toString themeDetails.rounding}px;
      }

      .close-button {
        background: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base00};
        text-shadow: none;
        padding: 0;
        border-radius: ${toString themeDetails.rounding}px;
        margin-top: 10px;
        margin-right: 16px;
      }

      .close-button:hover {
        box-shadow: inset 0 0 0 20px rgba(0, 0, 0, 0.8);
        background-color: #${config.lib.stylix.colors.base08};
        transition: all 0.15s ease-in-out;
        border: none;
      }

      .notification-default-action,
      .notification-action {
        padding: 4px;
        margin: 0;
        box-shadow: inset 0 0 0 1px #${config.lib.stylix.colors.base03};
        background: #${config.lib.stylix.colors.base00};
        border: none;
        border-radius: ${toString themeDetails.rounding}px;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        -gtk-icon-effect: none;
        background: #${config.lib.stylix.colors.base02};
      }

      .notification-default-action {
        border-radius: ${toString themeDetails.rounding}px;
      }

      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-action {
        border-radius: 0px;
        border-top: none;
        border-right: none;
      }

      .notification-action:first-child {
        border-bottom-left-radius: 10px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 10px;
        border-right: 1px solid #${config.lib.stylix.colors.base03};
      }

      .inline-reply {
        margin-top: 8px;
      }

      .inline-reply-entry {
        background: #${config.lib.stylix.colors.base01};
        color: #${config.lib.stylix.colors.base05};
        caret-color: #${config.lib.stylix.colors.base05};
        border: 1px solid #${config.lib.stylix.colors.base03};
        border-radius: ${toString themeDetails.rounding}px;
      }

      .inline-reply-button {
        margin-left: 4px;
        background: #${config.lib.stylix.colors.base0D};
        border: 1px solid #${config.lib.stylix.colors.base03};
        border-radius: ${toString themeDetails.rounding}px;
        color: #${config.lib.stylix.colors.base00};
      }

      .inline-reply-button:disabled {
        background: initial;
        color: #${config.lib.stylix.colors.base04};
        border: 1px solid transparent;
      }

      .inline-reply-button:hover {
        background: #${config.lib.stylix.colors.base0D};
      }

      .body-image {
        margin-top: 6px;
        background-color: #${config.lib.stylix.colors.base00};
        border-radius: ${toString themeDetails.rounding}px;
      }

      .summary {
        font-size: ${toString (themeDetails.font.size + 2)}px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base0D};
        text-shadow: none;
      }

      .time {
        font-size: ${toString (themeDetails.font.size - 2)}px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base04};
        text-shadow: none;
        margin-right: 18px;
      }

      .body {
        font-size: ${toString themeDetails.font.size}px;
        font-weight: 400;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      .control-center {
        background: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: ${toString themeDetails.rounding}px;
      }

      .control-center-list {
        background: transparent;
      }

      .control-center-list-placeholder {
        opacity: 0.5;
      }

      .floating-notifications {
        background: transparent;
      }

      .blank-window {
        background: alpha(black, 0.3);
      }

      .widget-title {
        color: #${config.lib.stylix.colors.base0D};
        background: #${config.lib.stylix.colors.base00};
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        font-size: ${toString (themeDetails.font.size + 3)}px;
        border-radius: ${toString themeDetails.rounding}px;
      }

      .widget-title > button {
        font-size: ${toString (themeDetails.font.size + 1)}px;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: #${config.lib.stylix.colors.base01};
        border: 1px solid #${config.lib.stylix.colors.base03};
        box-shadow: none;
        border-radius: ${toString themeDetails.rounding}px;
      }

      .widget-title > button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .widget-title > button:active {
        background: #${config.lib.stylix.colors.base03};
      }

      .widget-dnd {
        background: #${config.lib.stylix.colors.base00};
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        border-radius: ${toString themeDetails.rounding}px;
        font-size: ${toString (themeDetails.font.size + 2)}px;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-dnd > switch {
        border-radius: ${toString themeDetails.rounding}px;
        background: #${config.lib.stylix.colors.base01};
      }

      .widget-dnd > switch:checked {
        background: #${config.lib.stylix.colors.base0D};
      }

      .widget-dnd > switch slider {
        background: #${config.lib.stylix.colors.base05};
        border-radius: ${toString themeDetails.rounding}px;
      }

      .widget-label {
        margin: 10px 10px 5px 10px;
      }

      .widget-label > label {
        font-size: ${toString (themeDetails.font.size + 1)}px;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-mpris {
        color: #${config.lib.stylix.colors.base05};
        background: #${config.lib.stylix.colors.base00};
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        border-radius: ${toString themeDetails.rounding}px;
      }

      .widget-mpris > box > button {
        border-radius: ${toString themeDetails.rounding}px;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-mpris > box > button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .widget-mpris-player {
        padding: 5px 10px;
        margin: 10px;
      }

      .widget-mpris-title {
        font-weight: bold;
        font-size: ${toString (themeDetails.font.size + 1)}px;
      }

      .widget-mpris-subtitle {
        font-size: ${toString (themeDetails.font.size - 1)}px;
      }

      .widget-buttons-grid {
        font-size: x-large;
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: ${toString themeDetails.rounding}px;
        background: #${config.lib.stylix.colors.base00};
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
        margin: 3px;
        background: #${config.lib.stylix.colors.base01};
        border-radius: ${toString themeDetails.rounding}px;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .widget-menubar > box > .menu-button-bar > button {
        border: none;
        background: transparent;
      }

      .topbar-buttons > button {
        border: none;
        background: transparent;
      }

      .widget-volume {
        background: #${config.lib.stylix.colors.base00};
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: ${toString themeDetails.rounding}px;
        font-size: x-large;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-volume > box > button {
        background: #${config.lib.stylix.colors.base01};
        border: none;
      }

      .per-app-volume {
        background-color: #${config.lib.stylix.colors.base01};
        padding: 4px 8px 8px;
        margin: 0 8px 8px;
        border-radius: ${toString themeDetails.rounding}px;
      }

      .widget-backlight {
        background: #${config.lib.stylix.colors.base00};
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: ${toString themeDetails.rounding}px;
        font-size: x-large;
        color: #${config.lib.stylix.colors.base05};
      }
    '';
  };
}
