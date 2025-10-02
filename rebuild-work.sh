#!/bin/sh

home-manager switch \
    --flake .#work --extra-experimental-features nix-command \
    --extra-experimental-features flakes \
    --extra-experimental-features pipe-operators \
    -b backup
