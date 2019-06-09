self: super:
let
  inherit (super.pkgs) lib;
in

lib.optionalAttrs (super ? "nix") {
  racket2nix = super.nix.overrideRacketDerivation (oldAttrs: { pname = "racket2nix"; });
} //
lib.optionalAttrs (super ? "deinprogramm-signature" && super ? "icons") {
  deinprogramm-signature = super.deinprogramm-signature.overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "deinprogramm-signature+htdp-lib" && super ? "icons") {
  "deinprogramm-signature+htdp-lib" = super."deinprogramm-signature+htdp-lib".overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "gui-lib" && super ? "icons") {
  gui-lib = super.gui-lib.overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "htdp-lib" && super ? "icons") {
  htdp-lib = super.htdp-lib.overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "raart") { raart = super.raart.overrideAttrs (oldAttrs: { patches = [ (builtins.toFile "deps.patch" ''
--- a/raart/info.rkt
+++ b/raart/info.rkt
@@ -4,6 +4,11 @@
                "unix-signals"
                "reprovide-lang"
                "ansi"
+               "gui-lib"
+               "htdp-lib"
+               "pict-lib"
+               "plot-gui-lib"
+               "plot-lib"
                "struct-define"
                "base"))
 (define build-deps '("sandbox-lib"
'') ]; }); } //
lib.optionalAttrs (super ? "compatibility+compatibility-doc+data-doc+db-doc+distributed-p...") {
  "compatibility+compatibility-doc+data-doc+db-doc+distributed-p..." = super."compatibility+compatibility-doc+data-doc+db-doc+distributed-p...".overrideAttrs (oldAttrs: {
  buildInputs = oldAttrs.buildInputs or [] ++ builtins.attrValues {
    inherit (self.pkgs) glib cairo fontconfig gmp gtk3 gsettings-desktop-schemas libedit libjpeg_turbo libpng mpfr openssl pango poppler readline sqlite;
  }; });
}
