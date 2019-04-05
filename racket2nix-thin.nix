self: super: {
  "nix" = self.lib.mkRacketDerivation rec {
  pname = "nix";
  src = builtins.path { path = ./nix; name = "racket2nix"; };
  racketThinBuildInputs = [ self."base" self."rackunit-lib" ];
  };

}
