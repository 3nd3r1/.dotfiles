{
  description = "My minimal NixOS flake with multiple profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
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
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixGL,
      ...
    }@inputs:
    let
      nixosProfiles = [
        "bean"
      ];
      homeProfiles = [
        "bean"
        "graff"
      ];
      system = "x86_64-linux";
      devSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forDevSystems = nixpkgs.lib.genAttrs devSystems;

      # Allowed `<scope>:` prefixes for commit messages (see CLAUDE.md)
      commitScopes = [
        # profiles
        "bean"
        "graff"
        # modules
        "hyprland"
        "aerospace"
        "neovim"
        "zsh"
        "tmux"
        "kitty"
        "brave"
        "git"
        "ssh"
        "rofi"
        "obsidian"
        "karabiner"
        "lanmouse"
        "thunar"
        "nh"
        "visual"
        # repo
        "themes"
        "pkgs"
        "flake"
        "docs"
        "chore"
      ];

      mkPreCommit =
        sys:
        let
          devPkgs = nixpkgs.legacyPackages.${sys};
          scopes = nixpkgs.lib.concatStringsSep "|" commitScopes;
        in
        inputs.git-hooks.lib.${sys}.run {
          src = ./.;
          hooks = {
            nixfmt-tree = {
              enable = true;
              name = "treefmt";
              entry = nixpkgs.lib.getExe devPkgs.nixfmt-tree;
              files = "\\.nix$";
            };
            statix.enable = true;
            deadnix.enable = true;

            commit-scope = {
              enable = true;
              name = "commit-scope";
              stages = [ "commit-msg" ];
              entry = toString (
                devPkgs.writeShellScript "commit-scope" ''
                  msg=$(head -n1 "$1")
                  if ! printf '%s\n' "$msg" | grep -qE '^((fixup|squash|amend)! |Revert |Merge )|^(${scopes}): [a-z0-9]'; then
                    echo "commit-scope: expected '<scope>: <lowercase summary>', got: $msg" >&2
                    echo "allowed scopes: ${scopes}" >&2
                    exit 1
                  fi
                ''
              );
            };
          };
        };

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
          preSettings = import (./. + "/profiles/${profile}/settings.nix") {
            inherit pkgs inputs;
          };
          profileSystem = preSettings.system or system;
          profilePkgs =
            if profileSystem == system then
              pkgs
            else
              import nixpkgs {
                system = profileSystem;
                overlays = [ (import ./overlays { inherit inputs; }) ];
                config.allowUnfree = true;
              };
          settings = import (./. + "/profiles/${profile}/settings.nix") {
            pkgs = profilePkgs;
            inherit inputs;
          };
          themeDetails = import (./. + "/themes/${settings.theme}.nix") {
            pkgs = profilePkgs;
            inherit inputs;
          };
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = profilePkgs;
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
            mkBrewBin = import ./lib/mkBrewBin.nix profilePkgs;
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

      checks = forDevSystems (sys: {
        pre-commit = mkPreCommit sys;
      });

      devShells = forDevSystems (
        sys:
        let
          devPkgs = nixpkgs.legacyPackages.${sys};
          preCommit = self.checks.${sys}.pre-commit;
        in
        {
          default = devPkgs.mkShell {
            packages =
              preCommit.enabledPackages
              ++ (with devPkgs; [
                statix
                deadnix
                nixfmt
                nixfmt-tree
                nodejs
              ]);

            # Installs the git hooks into .git/hooks
            inherit (preCommit) shellHook;
          };
        }
      );
    };
}
