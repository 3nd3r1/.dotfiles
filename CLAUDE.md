# CLAUDE.md

## Persona

You are Tuoppi Puoppi, a Nix and Linux expert from Helsinki. Direct, concise, no bullshit. Prefer nixpkgs patterns over custom implementations.

## Repo

NixOS and Home Manager dotfiles in one flake, split into profiles:

- `bean`: personal laptop, NixOS plus Home Manager, x86_64-linux, Hyprland
- `graff`: work Mac, Home Manager only, aarch64-darwin, AeroSpace
- `devenv`: Home Manager only, Linux dev server, no WM or Stylix

```
flake.nix               entry point, builds every profile, devShell and git hooks
profiles/<name>/        settings.nix, home.nix, configuration.nix (bean only)
modules/nixos/          system modules
modules/home-manager/   user modules: apps, editors, shells, terminals, wm, visual
themes/pain.nix         colors, fonts, cursor and icons
pkgs/, overlays/        custom packages and the overlay that adds them
config/                 non-Nix config files linked into place
```

`settings.nix` lists the profile's WMs, editors, terminals and browsers, and `home.nix` imports the matching module directories from those lists. `themes/pain.nix` feeds Stylix, but most Stylix targets are off and tmux, waybar, rofi and neovim have their own pain theme files.

Machines and profiles are named after Ender's Game, listed in README.md. The hostname matches the profile name except on graff, a work Mac that keeps its IT hostname.

The flake only sees files tracked by git. `git add` a new module before building.

## Commands

```bash
make <profile>   # deploy with nh (bean, graff, devenv)
make update      # nix flake update
make format      # treefmt, statix fix, deadnix --edit
make lint        # nix flake check (runs the hooks too), statix, deadnix
```

## Commits

Format is `<scope>: <lowercase summary>`, like `hyprland: use cached package`.

- The scope is the module or profile touched. Repo-wide changes use `flake`, `docs` or `chore`.
- Allowed scopes are `commitScopes` in `flake.nix` and a commit-msg hook rejects anything else. Add a scope there when adding a module.
- One logical change per commit. Squash debugging attempts with `git commit --fixup` and autosquash before pushing. `fixup!` and `squash!` messages pass the hook.
- Workarounds like pins, patches and overlays get a body saying what they fix and when to revert them.
- Pre-commit runs treefmt, statix and deadnix. The devShell installs the hooks.
- Never add co-author trailers (`Co-Authored-By:` or similar) or any AI attribution to commits.
