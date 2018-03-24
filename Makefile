default: racket2nix

racket2nix:
	nix-build --no-out-link

pkgs-all:
	nix-build --out-link pkgs-all catalog.nix

test:
	nix-shell test.nix --run true 2>&1

.PHONY: racket2nix test
