{
  settings,
  themeDetails,
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
let
  kittyPkg = if settings.profile == "work" then (config.lib.nixGL.wrap pkgs.kitty) else pkgs.kitty;
in
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    package = kittyPkg;
    settings = {
      bold_font = "auto";
      active_tab_font_style = "bold";
      bold_italic_font = "auto";
      confirm_os_window_close = 0;
      cursor_shape = "underline";
      cursor_stop_blinking_after = 0;
      cursor_underline_thickness = "1.5";
      disable_ligatures = "never";
      editor = settings.preferredEditor;
      hide_window_decorations = "titlebar-only";
      inactive_tab_font_style = "normal";
      inactive_text_alpha = "1.0";
      italic_font = "auto";
      placement_strategy = "center";
      resize_in_steps = "yes";
      scrollback_lines = 10000;
      touch_scroll_multiplier = "1.0";
      wheel_scroll_multiplier = "5.0";
      window_margin_width = 0;
      window_padding_width = 0;
      enable_audio_bell = "no";
    };
    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "ctrl+shift+c" = "copy_to_clipboard";
      "shift+insert" = "paste_from_selection";

      "ctrl+shift+equal" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";
      "ctrl+shift+f6" = "set_font_size 16.0";
    };
  };
}
