{ inputs, config, lib, settings, pkgs, ... }:

{
imports = [
./hyprland/binds.nix
];

  home.packages = with pkgs; [ hyprcursor rose-pine-hyprcursor ];

  wayland.windowManager.hyprland = {
	enable = true;
	systemd.enable = true;
	};
}
