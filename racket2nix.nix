{ pkgs ? import ./pkgs {}
, callPackage ? pkgs.callPackage
, default-overlay ? import ./build-racket-default-overlay.nix
, racket2nix-thin ? import ./racket2nix-thin.nix
, racket-packages ? callPackage ./racket-packages.nix {}
}:

((racket-packages.extend default-overlay).extend racket2nix-thin).nix
