#!/bin/sh

sudo nixos-rebuild switch --flake ~/dotfiles#endervm
home-manager switch --flake .#ender -b backup

