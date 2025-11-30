.PHONY: laptop work devenv format lint check help

# Profile deployments
laptop:
	sudo nixos-rebuild switch --flake ~/dotfiles#laptop
	home-manager switch \
		--flake .#laptop \
		--extra-experimental-features nix-command \
		--extra-experimental-features flakes \
		--extra-experimental-features pipe-operators \
		-b backup

work:
	home-manager switch \
		--flake .#work \
		--extra-experimental-features nix-command \
		--extra-experimental-features flakes \
		--extra-experimental-features pipe-operators \
		-b backup

devenv:
	home-manager switch \
		--flake .#devenv \
		--extra-experimental-features nix-command \
		--extra-experimental-features flakes \
		--extra-experimental-features pipe-operators \
		-b backup

# Development tasks
format:
	nixfmt-tree .
	statix fix .

lint:
	nix flake check
	statix check .
