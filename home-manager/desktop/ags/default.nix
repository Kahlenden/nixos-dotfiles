{inputs, pkgs, ...}:{

  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = (pkgs.callPackage ./aylur-ags.nix{});
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk_6_0
      accountsservice
      #pkgs.libsoup_3
    ];
  };

}
