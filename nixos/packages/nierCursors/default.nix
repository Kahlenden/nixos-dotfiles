{
  stdenvNoCC,
  fetchurl
}:

stdenvNoCC.mkDerivation rec {
  pname = "NieR Cursors";
  version = "latest";

  src = fetchurl {
    url = "https://github.com/Beinsezii/NieR-Cursors/releases/download/2020-08-25/NieR_Cursors_2020-08-25.tar.xz";
    sha256 = "sha256-Smkf/A+HDuJ85f3dx1WIQ+4pHyVpJvi/A8aZoFKS8yQ=";
  };

  unpackPhase = ''
    mkdir source
    tar -xf $src -C source
  '';

  installPhase = ''
    runHook preInstall
    install -dm 755 $out/share/icons/
    cp -r source/* $out/share/icons/
    runHook postInstall
  '';
}
