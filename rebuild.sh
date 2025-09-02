#!/bin/sh

sudo nixos-rebuild switch --flake ~/dotfiles#enderlaptop
home-manager switch --flake .#ender

