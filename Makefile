.PHONY: bean graff devenv format lint check help update

bean graff devenv: export NIX_CONFIG := extra-experimental-features = nix-command flakes pipe-operators

NH_RUN := nix run --inputs-from . nixpkgs\#nh --
NH := $(if $(shell command -v nh),nh,$(NH_RUN))

# Profile deployments
bean:
	$(NH) os switch . -H bean
	$(NH) home switch . -c bean -b backup

graff:
	$(NH) home switch . -c graff -b backup

devenv:
	$(NH) home switch . -c devenv -b backup

# Development tasks
format:
	treefmt .
	statix fix .
	deadnix --edit .

lint:
	nix flake check --extra-experimental-features nix-command --extra-experimental-features flakes
	statix check .
	deadnix --fail .

# Misc
update:
	NIX_CONFIG="access-tokens = github.com=$$(gh auth token -h github.com)" \
		nix flake update --extra-experimental-features nix-command --extra-experimental-features flakes
