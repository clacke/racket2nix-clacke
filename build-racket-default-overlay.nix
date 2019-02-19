self: super:
let
  inherit (super.pkgs) lib;
in

lib.optionalAttrs (super ? "deinprogramm-signature" && super ? "icons") {
  deinprogramm-signature = super.deinprogramm-signature.overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "deinprogramm-signature+htdp-lib" && super ? "icons") {
  "deinprogramm-signature+htdp-lib" = super."deinprogramm-signature+htdp-lib".overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "gui-lib" && super ? "icons") {
  gui-lib = super.gui-lib.overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "htdp-doc") {
  htdp-doc = super.htdp-doc.overrideRacketDerivation (oldAttrs: {
    FONTCONFIG_FILE = let inherit (super.pkgs) makeFontsConf freefont_ttf; in makeFontsConf {
      fontDirectories = [ freefont_ttf ];
    };
  });
} //
lib.optionalAttrs (super ? "htdp-lib" && super ? "icons") {
  htdp-lib = super.htdp-lib.overrideRacketDerivation (oldAttrs: { racketBuildInputs = oldAttrs.racketBuildInputs ++ [ self.icons ]; });
} //
lib.optionalAttrs (super ? "compatibility+compatibility-doc+data-doc+db-doc+distributed-p...") {
  "compatibility+compatibility-doc+data-doc+db-doc+distributed-p..." = super."compatibility+compatibility-doc+data-doc+db-doc+distributed-p...".overrideAttrs (oldAttrs: {
  buildInputs = oldAttrs.buildInputs or [] ++ builtins.attrValues {
    inherit (self.pkgs) glib cairo fontconfig gmp gtk3 gsettings-desktop-schemas libedit libjpeg_turbo libpng mpfr openssl pango poppler readline sqlite;
  }; });
} //
lib.optionalAttrs (super ? "csexp") {
  csexp = super.csexp.overrideRacketDerivation (oldAttrs: {
    postPatch = ''
      sed -i -e "s/(define deps '())/(define deps '(\"base\" \"rackunit-lib\"))/" csexp/info.rkt
    '';
    racketThinBuildInputs = [ self.base self.rackunit-lib ];
  });
} //
lib.optionalAttrs (super ? "magenc") {
  magenc = super.magenc.overrideRacketDerivation (oldAttrs: {
    postPatch = ''
      sed -i magenc/info.rkt \
        -e 's/"crypto"/"crypto-lib"/' \
        -e '/scribblings/d'
    '';
  });
}
