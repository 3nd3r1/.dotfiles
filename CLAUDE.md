# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a NixOS/Home Manager dotfiles repository using Nix flakes with multiple profiles. The configuration uses a modular architecture with shared themes, profile-specific settings, and extensive customization for desktop environments.

## Build Commands

### Profile Deployment
```bash
# Deploy laptop profile (NixOS + Home Manager)
./rebuild-laptop.sh

# Deploy work profile (Home Manager only)
./rebuild-work.sh

# Deploy devenv profile (Home Manager only)  
./rebuild-devenv.sh
```

### Manual Commands
```bash
# NixOS rebuild for laptop profile
sudo nixos-rebuild switch --flake ~/dotfiles#laptop

# Home Manager rebuild for any profile
home-manager switch --flake .#<profile> --extra-experimental-features nix-command --extra-experimental-features flakes --extra-experimental-features pipe-operators -b backup
```

### Development Commands
```bash
# Check flake syntax
nix flake check

# Update flake inputs
nix flake update

# Build specific configuration without switching
nix build .#nixosConfigurations.<profile>.config.system.build.toplevel
nix build .#homeConfigurations.<profile>.activationPackage
```

## Architecture

### Flake Structure
- **flake.nix**: Main flake configuration defining three profiles (laptop, work, devenv)
- **profiles/**: Profile-specific configurations and settings
- **modules/**: Reusable NixOS and Home Manager modules
- **themes/**: Theme definitions (currently using "pain" theme)
- **overlays/**: Package overlays
- **pkgs/**: Custom package definitions

### Key Design Patterns

1. **Profile-based Configuration**: Each profile has its own `settings.nix` that defines:
   - User details (hostname, username, email)
   - Enabled components (WMs, editors, browsers, terminals)
   - Theme and wallpaper selection
   - Profile-specific features (nixGL for work profile)

2. **Modular Architecture**: 
   - `modules/nixos/`: System-level modules (apps, window managers)
   - `modules/home-manager/`: User-level modules (editors, shells, browsers, visual)
   - Each module is imported dynamically based on profile settings

3. **Theme System**: Uses Stylix with base16 color schemes. The "pain" theme defines:
   - Purple (#800080) and orange (#ff8000) color palette
   - Custom fonts, icons, and cursor themes
   - Consistent styling across all applications

### Profiles

- **laptop**: Full NixOS configuration for personal laptop with Hyprland
- **work**: Home Manager only for work machine with nixGL support  
- **devenv**: Minimal development environment configuration

### Key Components

- **Window Manager**: Hyprland with Waybar, custom keybinds and rules
- **Editor**: Neovim with nixvim configuration including LSP, formatting, and plugins
- **Shell**: Zsh with Oh My Zsh, custom theme, tmux integration
- **Terminal**: Kitty with theme integration
- **File Manager**: Thunar (laptop) or Nautilus (work)
- **Applications**: Development tools, communication apps, utilities

## File Locations

- Configuration entry points: `profiles/<profile>/configuration.nix` and `profiles/<profile>/home.nix`
- Settings: `profiles/<profile>/settings.nix`
- Neovim config: `modules/home-manager/editors/neovim/`
- Hyprland config: `modules/home-manager/wm/hyprland/`
- Theme definitions: `themes/pain.nix`

## Common Operations

When modifying configurations:

1. Edit the relevant module file in `modules/`
2. For profile-specific changes, edit `profiles/<profile>/settings.nix`
3. Run the appropriate rebuild script
4. Theme changes require editing `themes/pain.nix`

The modular structure allows for easy addition of new profiles, applications, or themes while maintaining consistency across configurations.