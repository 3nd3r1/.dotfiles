{
  description = "My minimal NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      settings = import (./. + "/settings.nix") { inherit pkgs inputs; };
      pkgs = import nixpkgs { system = settings.system; };
    in {
      # NixOS configuration entrypoint.
      # 'nixos-rebuild switch --flake .#hostname
      nixosConfigurations = {
        ${settings.hostname} = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit settings;
          };
          modules = [
            (./. + "/profiles" + ("/" + settings.profile)
              + "/configuration.nix")
            inputs.stylix.nixosModules.stylix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint.
      # 'home-manager switch --flake .#username
      homeConfigurations = {
        ${settings.username} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${settings.system};
          modules = [
            (./. + "/profiles" + ("/" + settings.profile) + "/home.nix")
            inputs.stylix.homeModules.stylix
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };
    };
}
