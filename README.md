# My .dotfiles

Here are all my .dotfiles

## What I use

- neovim 
- qtile
- tmux
- zsh
- st
- Theme: Material-Black-Plum-BE
- Icons: Material-Black-Plum-Suru

## Preview

![Preview](/Pictures/preview.png)

## Install

- Install packages
    ```
    sudo apt-get install zsh picom blueman xorg-dev arandr i3lock-fancy rofi xclip stow xsel rlwrap
    ```
- [Install nvim](https://github.com/3nd3r1/init.lua)
- Install zoxide
    ```
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    ```
- Install oh-my-zsh
    ```
    ZSH=$HOME/.config/oh-my-zsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
- Install zsh-autosuggestions
    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/oh-my-zsh/custom/plugins/zsh-autosuggestions
    ```
- Install zsh-syntax-highlighting
    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    ```
- Install cht.sh
    ```
    curl https://cht.sh/:cht.sh > "$HOME/.local/bin/cht.sh"
    chmod +x "$HOME/.local/bin/cht.sh"
    ```
