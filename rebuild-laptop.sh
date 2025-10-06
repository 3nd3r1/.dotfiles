#!/bin/sh

sudo nixos-rebuild switch --flake ~/dotfiles#laptop

home-manager switch \
    --flake .#laptop \
    --extra-experimental-features nix-command \
    --extra-experimental-features flakes \
    --extra-experimental-features pipe-operators \
    -b backup
