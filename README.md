# My .dotfiles

Here are all my .dotfiles

## What I use

- neovim 
- qtile
- tmux
- zsh (oh-my-zsh)
- st
- nix
- Theme: Material-Black-Plum-BE
- Icons: Material-Black-Plum-Suru
- Font: [MesloLG Nerd Font](https://github.com/andreberg/Meslo-Font)

## Preview

![Preview](/Pictures/preview.png)

## Install

- Install apt packages
    ```
    sudo apt-get install zsh picom blueman xorg-dev arandr i3lock-fancy rofi xclip stow xsel rlwrap aptitude
    ```
- Install nix
    ```
    sh <(curl -L https://nixos.org/nix/install) --daemon
    ```
- Install nix packages
    ```
    nix-env -i kubernetes-helm kotlin krew yq zoxide lazygit
    ```
- Install oh-my-zsh
    ```
    ZSH=$HOME/.config/oh-my-zsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    ```
- Install cht.sh
    ```
    curl https://cht.sh/:cht.sh > "$HOME/.local/bin/cht.sh"
    chmod +x "$HOME/.local/bin/cht.sh"
    ```
- [Install tmux](https://github.com/3nd3r1/.tmux)
- [Install nvim](https://github.com/3nd3r1/init.lua)
