#!/bin/sh

sudo nixos-rebuild switch --flake ~/dotfiles#laptop
home-manager switch --flake .#laptop -b backup

