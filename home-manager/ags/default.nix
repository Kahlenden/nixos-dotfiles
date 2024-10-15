{inputs, pkgs, ...}:{

  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = (pkgs.callPackage ./aylur-ags.nix{});
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
      #pkgs.libsoup_3
    ];
  };

}
