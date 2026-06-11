{ lib, pkgs, ... }:
# Karabiner-Elements config, managed declaratively.
# The app itself (and its system driver) must be installed manually, e.g.
# `brew install --cask karabiner-elements`, and granted Input Monitoring.
# Nix only owns ~/.config/karabiner/karabiner.json.
let
  capsToHyper = {
    description = "Caps Lock -> ⌃⌥⌘, always (hold and tap)";
    manipulators = [
      {
        type = "basic";
        from = {
          key_code = "caps_lock";
          modifiers.optional = [ "any" ];
        };
        to = [
          {
            key_code = "left_command";
            modifiers = [
              "left_control"
              "left_option"
            ];
          }
        ];
      }
    ];
  };

  config = {
    global.show_in_menu_bar = false;
    profiles = [
      {
        name = "Default";
        selected = true;
        complex_modifications.rules = [ capsToHyper ];
        virtual_hid_keyboard.keyboard_type_v2 = "ansi";
      }
    ];
  };
in
{
  xdg.configFile = lib.mkIf pkgs.stdenv.isDarwin {
    "karabiner/karabiner.json".text = builtins.toJSON config;
  };
}
