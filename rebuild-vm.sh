#!/bin/sh

sudo nixos-rebuild switch --flake ~/dotfiles#vm
home-manager switch --flake .#vm -b backup

