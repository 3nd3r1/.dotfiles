{ inputs, config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.wayland pkgs.wl-clipboard ];

  services.xserver = {
    enable = true;
   xkb = {
	variant = "";
	layout = "fi";
}
	displayManager.startx.enable = true;
  }


  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

	xdg.portal = {
	enable = true;
	xdgOpenUsePortal = true;
	config = {
		hyprland.default = ["hyprland"];
	};

	};
}
