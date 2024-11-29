{
stdenv
, lib
, fetchFromGitHub
, crudini
}:

stdenv.mkDerivation (finalAttrs: {
  name = "sugar-candy";
  pname = "sddm-theme-${finalAttrs.name}";
  version = "1.6";

  src = fetchFromGitHub {
    owner = "Kangie";
    repo = "sddm-${finalAttrs.name}";
    rev = "v${finalAttrs.version}";
    sha256 = "";
  };

  nativeBuildInputs = [
    crudini
  ];

  themeIni = [
    { section = "General"; key = "Background"; value = toString ./backgrounds/bg1.jpg; }
    { section = "General"; key = "ScreenHeight"; value = "1080"; }
    { section = "General"; key = "ScreenWidth"; value = "1920"; }
    { section = "General"; key = "BlurRadius"; value = "50"; }
    { section = "General"; key = "ForceHideCompletePassword"; value = "true"; }
    { section = "General"; key = "HeaderText"; value = "Glory To Mankind!"; }
    { section = "General"; key = "AccentColor"; value = "#d2f8d2";}
  ];

  buildCommand = ''
    dir=$out/share/sddm/themes/${finalAttrs.name}
    doc=$out/share/doc/${finalAttrs.pname}

    mkdir -p $dir $doc
    if [ -d $src/${finalAttrs.name} ]; then
      srcDir=$src/${finalAttrs.name}
    else
      srcDir=$src
    fi
    cp -r $srcDir/* $dir/
    for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
      test -f $f && mv $f $doc/
    done

    chmod 644 $dir/theme.conf

    ${lib.concatMapStringsSep "\n" (e: ''
      crudini --set --inplace $dir/theme.conf "${e.section}" "${e.key}" "${e.value}"
    '') finalAttrs.themeIni}
  '';
})
