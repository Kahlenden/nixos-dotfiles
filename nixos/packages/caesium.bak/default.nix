{ pkgs
, stdenv
, lib
, fetchFromGitHub
, fetchpatch2
, wrapQtAppsHook
, cmake
, qtbase
, qtsvg
, qttools
, makeDesktopItem
, imagemagick
, copyDesktopItems
#, libcaesium
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "caesium-image-compressor";
  version = "2.6.0";

  src = fetchFromGitHub {
    owner = "Lymphatus";
    repo = "caesium-image-compressor";
    rev = "v${finalAttrs.version}";
    hash = "sha256-TbhcGGS22wfN47R78Ns2Nct8w7haMCNDatG8NXRXeK4=";#sha256-TJnDHk2FhjNPM7Z1WXMlFSxZjdZO+gcX9SyaYDsj/NE=";
  };

  patches = [
    # Remove Windows-specific build code Linux
    # https://github.com/Lymphatus/caesium-image-compressor/pull/199
    (fetchpatch2 {
      url = "https://github.com/Lymphatus/caesium-image-compressor/commit/4293296340e0bd497d26d9420d00f39c30b0e9e6.patch";
      hash = "sha256-0ZUWC7HCqKgW6eE+5KWrbjiL/s1j/PT5+8GYfSzLutM=";
    })
  ];
/*
  installPhase = ''
    # Make desktop Icon
    convert $src/resources/icons/logo.png -resize 128x128 $out/share/icons/Caesium.png
    for RES in 16 24 32 48 64 128 256
    do
        mkdir -p $out/share/icons/hicolor/"$RES"x"$RES"/apps
        convert $src/resources/icons/logo.png -resize "$RES"x"$RES" $out/share/icons/hicolor/"$RES"x"$RES"/apps/Caesium.png
    done
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "Caesium-image-compressor";
      exec = "caesium-image-compressor";
      genericName = "Caesium is an image compression software that helps you store, send and share digital pictures, supporting JPG, PNG and WebP formats. You can quickly reduce the file size (and resolution, if you want) by preserving the overall quality of the image.";
      icon = "Caesium";
      desktopName = "Caesium image compressor";
    })
  ];
*/
  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
    imagemagick
    copyDesktopItems
  ];

  buildInputs = [
    (pkgs.callPackage ./libcaesium.nix{})
    qtbase
    qtsvg
    qttools
  ];

  meta = with lib; {
    description = "Reduce file size while preserving the overall quality of the image";
    homepage = "https://github.com/Lymphatus/caesium-image-compressor";
    platforms = platforms.linux;
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ jtojnar ];
  };
})
