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
    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lan-mouse = {
      url = "github:feschber/lan-mouse";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixGL,
      ...
    }@inputs:
    let
      nixosProfiles = [
        "laptop"
      ];
      homeProfiles = [
        "laptop"
        "work"
        "devenv"
      ];
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ (import ./overlays { inherit inputs; }) ];
      };

      mkNixosConfiguration =
        profile:
        let
          settings = import (./. + "/profiles/${profile}/settings.nix") {
            inherit pkgs inputs;
          };
          themeDetails = import (./. + "/themes/${settings.theme}.nix") {
            inherit pkgs inputs;
          };
        in
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs settings themeDetails; };
          modules = [
            (./. + "/profiles/${profile}/configuration.nix")
            inputs.stylix.nixosModules.stylix
          ];
        };

      mkHomeConfiguration =
        profile:
        let
          settings = import (./. + "/profiles/${profile}/settings.nix") {
            inherit pkgs inputs;
          };
          themeDetails = import (./. + "/themes/${settings.theme}.nix") {
            inherit pkgs inputs;
          };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            (./. + "/profiles/${profile}/home.nix")
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
            inputs.lan-mouse.homeManagerModules.default
          ];
          extraSpecialArgs = {
            inherit
              inputs
              settings
              themeDetails
              nixGL
              ;
          };
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.listToAttrs (
        map (profile: {
          name = profile;
          value = mkNixosConfiguration profile;
        }) nixosProfiles
      );

      homeConfigurations = nixpkgs.lib.listToAttrs (
        map (profile: {
          name = profile;
          value = mkHomeConfiguration profile;
        }) homeProfiles
      );

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          statix
          deadnix
          nixfmt
          nixfmt-tree
        ];

        shellHook = "";
      };
    };
}
