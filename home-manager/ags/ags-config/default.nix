{
  stdenv,
  fetchFromGitHub,
  esbuild
}:

  stdenv.mkDerivation {
    name = "Aylur-ags-config";

    src = fetchFromGitHub {
      owner = "Aylur";
      repo = "dotfiles";
      rev = "18b83b2d2c6ef2b9045edefe49a66959f93b358a";
      hash = "sha256-sC4D2a7AT8QcUZsJtVyL3oFqPLdsFa1CqOJFPFM3XHw=";
    };

    buildPhase = ''
      ${esbuild}/bin/esbuild \
        --bundle $src/ags/main.ts \
        --outfile=$out/main.js \
        --format=esm \
        --external:resource://\* \
        --external:gi://\* \
    '';

    installPhase = ''
      cp -r $src/ags/assets $out
      cp -r $src/ags/style $out
      cp -r $src/ags/widget $out
      mv $out/main.js $out/config.js
    '';
  }

