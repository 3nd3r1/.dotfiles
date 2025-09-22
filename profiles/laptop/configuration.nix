{
  pkgs,
  lib,
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
    "${nixosModulesPath}/apps/lanmouse.nix"
    "${nixosModulesPath}/apps/kdeconnect.nix"
  ]
  ++ (map (wm: "${nixosModulesPath}/wm/${wm}.nix") settings.wms);

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nix thing
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Networking
  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;

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

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL = "1";
  };

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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 4242 ];
      allowedUDPPorts = [ 4242 ];
    };
  };

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
