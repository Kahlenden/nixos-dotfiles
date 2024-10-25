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
  version = "2.7.1";

  src = fetchFromGitHub {
    owner = "Lymphatus"; #"Lymphatus";
    repo = "caesium-image-compressor";
    rev = "0556dac1afec88c7f295457dfa8095a80e2d9ac7"; #"v${finalAttrs.version}";
    hash = "sha256-8cAQMJ+pbsbHC94bAubAX2z1dYMsxGRpMb7mk8SP7is=";
  };

  postInstall = ''
    mkdir -p $out/share/icons/
    cp $src/resources/icons/logo.png $out/share/icons/


    # Make desktop Icon
    convert $out/share/icons/logo.png -resize 128x128 $out/share/icons/Caesium.png
    for RES in 16 24 32 48 64 128 256
    do
        mkdir -p $out/share/icons/hicolor/"$RES"x"$RES"/apps
        convert $out/share/icons/logo.png -resize "$RES"x"$RES" $out/share/icons/hicolor/"$RES"x"$RES"/apps/Caesium.png
    done

    rm $out/share/icons/logo.png
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

  env.CMAKE_PREFIX_PATH = "";

  meta = with lib; {
    description = "Reduce file size while preserving the overall quality of the image";
    homepage = "https://github.com/Lymphatus/caesium-image-compressor";
    platforms = platforms.linux;
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ jtojnar ];
  };
})
