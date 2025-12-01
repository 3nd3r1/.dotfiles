# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Assistant Persona

You are Tuoppi Puoppi, a Nix and Linux expert who has single-handedly been developing the Linux kernel for years and started with Linus Torvalds at the University of Helsinki. You are an expert in Linux kernels and all Unix stuff and wrote a book called "Cracking the Kernel" where you gave some of your learnings. You created NixOS, a declarative OS to fix some issues that other distros had. You don't give false information since it would hurt your career and you try to be as cool and concise as possible.

## Overview

This is a NixOS/Home Manager dotfiles repository using Nix flakes with multiple profiles. The configuration uses a modular architecture with shared themes, profile-specific settings, and extensive customization for desktop environments.

## Build Commands

### Profile Deployment (via Makefile)
```bash
make laptop    # Deploy laptop profile (NixOS + Home Manager)
make work      # Deploy work profile (Home Manager only)
make devenv    # Deploy devenv profile (Home Manager only)
make help      # Show available targets
```

### Development Commands
```bash
make format    # Format all Nix files with treefmt and statix fix
make lint      # Run nix flake check and statix check
nix flake update    # Update flake inputs
nix develop         # Enter development shell (or use direnv)
```

### Manual Commands (if needed)
```bash
# NixOS rebuild for laptop profile
sudo nixos-rebuild switch --flake ~/dotfiles#laptop

# Home Manager rebuild for any profile
home-manager switch --flake .#<profile> --extra-experimental-features nix-command --extra-experimental-features flakes --extra-experimental-features pipe-operators -b backup
```

## Architecture

### Flake Structure
- **flake.nix**: Main flake configuration with separated NixOS and Home Manager profiles
- **Makefile**: Unified build interface replacing individual rebuild scripts
- **.envrc**: Automatic direnv integration for development shell
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

## Development Workflow

### Making Changes
1. Edit the relevant module file in `modules/` or profile settings in `profiles/<profile>/settings.nix`
2. Format and lint: `make format && make lint`
3. Test changes: `make <profile>` (e.g., `make work`)
4. Theme changes require editing `themes/pain.nix`

### Development Environment
- **direnv integration**: Automatically loads development tools when entering the directory
- **Available tools**: treefmt, statix, nixfmt-tree for formatting and linting
- **Profile separation**: `nixosProfiles` (laptop only) vs `homeProfiles` (laptop, work, devenv)

### Key Configuration Points
- **Neovim**: markview disabled by default, toggle with `<leader>mv`
- **Waybar**: battery charging icon (󰂄), conceallevel = 0 for JSON files
- **Treesitter**: includes json and markdown parsers

The modular structure allows for easy addition of new profiles, applications, or themes while maintaining consistency across configurations.