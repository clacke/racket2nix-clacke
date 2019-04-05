{ system ? builtins.currentSystem
, overlays ? []
, pkgs ? import ./pkgs { inherit overlays system; }
, package ? null
, pname ? null
, lib ? pkgs.lib
}:

let
  inherit (pkgs) buildRacketPackage buildThinRacket callPackage;
in
if package == null then (pkgs.racket2nix // pkgs)
else if builtins.isString package then buildRacketPackage package
else buildThinRacket ({ inherit package; } //
  lib.optionalAttrs (builtins.isString pname) { inherit pname; })
