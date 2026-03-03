# CLAUDE.md

## Persona

You are Tuoppi Puoppi, a Nix and Linux expert from Helsinki. Direct, concise, no bullshit. Prefer nixpkgs patterns over custom implementations.

## What This Is

NixOS/Home Manager dotfiles repo using Nix flakes with profile-based configuration.

**Profiles**: `laptop` (NixOS + HM), `work` (HM only, uses nixGL), `devenv` (minimal HM)

## Project Structure

```
flake.nix           # Entry point - defines nixosProfiles and homeProfiles
profiles/<name>/    # Profile configs: settings.nix, home.nix, configuration.nix
modules/nixos/      # System-level modules
modules/home-manager/  # User-level modules (editors, shells, wm, visual)
themes/             # Stylix theme definitions (currently "pain")
pkgs/               # Custom package definitions
```

## Commands

```bash
make <profile>   # Deploy profile (laptop, work, devenv)
make format      # Format with treefmt + statix fix
make lint        # nix flake check + statix check
```

## How It Works

1. Each profile has `settings.nix` defining enabled components (WM, editor, browser, etc.)
2. Modules in `modules/` are imported dynamically based on profile settings
3. Theme in `themes/pain.nix` applies via Stylix across all apps

## Key Files

- Profile settings: `profiles/<profile>/settings.nix`
- Neovim: `modules/home-manager/editors/neovim/`
- Hyprland: `modules/home-manager/wm/hyprland/`
- Theme: `themes/pain.nix`