{pkgs, stdenv, fetchFromGitHub }:
#let 
#  theme = ./theme;
#in
{
  myCustomTheme = stdenv.mkDerivation rec {
    pname = "myCustomTheme";
    version = "";
    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/themes/myCustomTheme/gnome-shell/
      cp $src/* $out/share/themes/myCustomTheme/gnome-shell/
    '';

    src = ./theme;
  };
}

