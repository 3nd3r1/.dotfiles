#!/bin/sh

home-manager switch --flake .#work -b backup --extra-experimental-features nix-command --extra-experimental-features flakes

