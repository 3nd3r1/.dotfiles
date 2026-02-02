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
  ]
  ++ (map (wm: "${nixosModulesPath}/wm/${wm}.nix") settings.wms);

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [
      "quiet"
      "loglevel=1"
    ];
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
    ];
  };

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
