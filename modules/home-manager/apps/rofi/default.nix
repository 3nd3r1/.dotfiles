{
  settings,
  themeDetails,
  lib,
  ...
}:
{
  programs.rofi = {
    enable = true;
    theme = lib.mkForce ./themes/${settings.theme}.rasi;
    settings = {
      font = "${themeDetails.font.name} ${toString themeDetails.font.size}";
      modes = [
        "drun"
        "run"
        "window"
      ];
      width = 1000;
      sidebar-mode = true;
      lines = 10;
      show-icons = true;
      fullscreen = false;
      show-match = false;
      separator-style = "solid";
      hide-scrollbar = true;
      kb-row-up = "Up,Control+k,Shift+Tab,Shift+ISO_Left_Tab";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-remove-to-eol = "Control+Shift+e";
      kb-mode-previous = "Shift+Left,Control+Shift+Tab,Control+h";
      kb-remove-char-back = "BackSpace";
    };
  };
}
