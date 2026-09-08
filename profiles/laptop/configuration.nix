{
  pkgs,
  settings,
  inputs,
  ...
}:
let
  nixosModulesPath = "${inputs.self}/modules/nixos";
in
{
  imports = [
    ./hardware-configuration.nix
    "${nixosModulesPath}/apps/thunar.nix"
    "${nixosModulesPath}/apps/zoom.nix"
    "${nixosModulesPath}/apps/lanmouse.nix"
    "${nixosModulesPath}/apps/expo.nix"
    "${nixosModulesPath}/apps/kdeconnect.nix"
    "${nixosModulesPath}/apps/nixld.nix"
    "${nixosModulesPath}/apps/zsa.nix"
  ]
  ++ (map (wm: "${nixosModulesPath}/wm/${wm}") settings.wms);

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Kernel 6.17+ made O_NOFOLLOW on /proc/<pid>/root return ELOOP, which breaks
    # xdg-desktop-portal <=1.22 caller identification -> every portal request from
    # non-Flatpak apps (file chooser, save dialog, Secret) is denied.
    # See https://github.com/flatpak/xdg-desktop-portal/issues/1953
    # Revert to the default kernel once nixpkgs ships a patched xdg-desktop-portal.
    kernelPackages = pkgs.linuxPackages_6_12;
  };

  # Nix thing
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # Networking
  networking = {
    hostName = settings.hostname;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [ networkmanager-openvpn ];
    };
    firewall = {
      enable = true;
    };
  };

  # Docker
  virtualisation.docker.enable = true;

  # Timezone
  time.timeZone = settings.timezone;

  # Locale
  i18n.defaultLocale = settings.locale;
  console.keyMap = "fi";

  # Shell
  programs.${settings.shell}.enable = true;

  # Users.
  users.users.${settings.username} = {
    isNormalUser = true;
    shell = settings.shellPkg;
    description = settings.username;
    extraGroups = [
      "wheel"
      "docker"
      "plugdev"
    ];
  };

  users.users.neko = {
    isNormalUser = true;
    description = "neko";
    initialPassword = "neko";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [ google-chrome ];
  };

  services.desktopManager.gnome.enable = true;

  nixpkgs.overlays = [
    (_: prev: {
      cantarell-fonts = prev.runCommand "cantarell-fonts-stub" { } "mkdir $out";
    })
    # xdg-desktop-portal >=1.20 denies EVERY portal request (file chooser, save
    # dialog, Secret, ...) from non-sandboxed apps when it cannot read the
    # caller's /proc/<pid>/root - which is the case for Chromium/Electron (they
    # make their processes non-dumpable) under this unprivileged user service.
    # Patch the flatpak AND linyaps detectors to fall through to "host app".
    # https://github.com/flatpak/xdg-desktop-portal/issues/1953
    (_: prev: {
      xdg-desktop-portal = prev.xdg-desktop-portal.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          ../../pkgs/xdg-desktop-portal-host-fallback.patch
        ];
        doCheck = false;
      });
    })
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Services
  services = {
    # Sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    # USB support
    udisks2.enable = true;
    gvfs.enable = true;
    devmon.enable = true;

    # OpenSSH
    openssh.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL = "1";
  };

  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    kitty
    git
  ];

  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
