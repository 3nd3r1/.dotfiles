{
  description = "My minimal NixOS flake with multiple profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      profiles = [ "laptop" "work" ];

      mkNixosConfiguration = profile:
        let
          settings = import (./. + "/profiles/${profile}/settings.nix") {
            inherit pkgs inputs;
          };
          pkgs = import nixpkgs { system = settings.system; };
        in nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs settings; };
          modules = [
            (./. + "/profiles/${profile}/configuration.nix")
            inputs.stylix.nixosModules.stylix
          ];
        };

      mkHomeConfiguration = profile:
        let
          settings = import (./. + "/profiles/${profile}/settings.nix") {
            inherit pkgs inputs;
          };
          pkgs = import nixpkgs { system = settings.system; };
        in home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${settings.system};
          modules = [
            (./. + "/profiles/${profile}/home.nix")
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
          ];
          extraSpecialArgs = { inherit inputs settings; };
        };

    in {
      nixosConfigurations = nixpkgs.lib.listToAttrs (map (profile: {
        name = profile;
        value = mkNixosConfiguration profile;
      }) profiles);

      homeConfigurations = nixpkgs.lib.listToAttrs (map (profile: {
        name = profile;
        value = mkHomeConfiguration profile;
      }) profiles);
    };
}
