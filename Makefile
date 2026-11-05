.PHONY: bean graff devenv format lint check help update

# nh shells out to nix, so pass the features through the environment
bean graff devenv: export NIX_CONFIG := extra-experimental-features = nix-command flakes pipe-operators

# Profile deployments
bean:
	nh os switch . -H bean
	nh home switch . -c bean -b backup

graff:
	nh home switch . -c graff -b backup

devenv:
	nh home switch . -c devenv -b backup

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
