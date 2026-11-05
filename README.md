# my dotfiles

This repo is the home for my dotfiles. I manage them with Nix.

## what's here

- **WM**: hyprland + waybar (laptop), aerospace (work)
- **Editor**: neovim (nixvim config)  
- **Terminal**: kitty + tmux + zsh (oh-my-zsh)
- **Theme**: custom "pain" theme (purple/orange vibes)
- **File manager**: thunar (laptop), finder (work)
- **Launcher**: rofi (laptop)

## setup

```bash
# clone wherever
git clone https://github.com/3nd3r1/.dotfiles ~/dotfiles
cd ~/dotfiles

# laptop setup
make laptop

# work setup  
make work

# dev server setup
make devenv
```

`make` deploys with nh, which isn't installed on a fresh machine. Do the first switch without it:

```bash
sudo nixos-rebuild switch --flake .#laptop               # laptop only
nix run nixpkgs#nh -- home switch . -c work -b backup    # or -c laptop / -c devenv
```

## profiles

- `laptop` - personal laptop setup
- `work` - work mac, home manager only
- `devenv` - dev server, home manager only, shell and neovim

## machine names

machines are named after ender's game:

- `bean` - laptop
- `dragon` - desktop

not applied yet, the laptop is still `enderlaptop` and the desktop `ENDER-PC`. new machines get a new name from the book. work and devenv keep the hostnames they were given. never use `ender`, that's the username.

## theme

everything uses the "pain" colorscheme:
- purple (#800080) 
- orange (#ff8000)
- black backgrounds
- custom tmux/waybar/rofi themes

![preview](./assets/pictures/preview.png)
