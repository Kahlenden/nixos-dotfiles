{inputs, pkgs, ...}:{

  imports = [
    inputs.ags.homeManagerModules.default
  ];
  
  programs.ags = {
    enable = true;
    configDir = (pkgs.callPackage ./ags-config{}); 
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
      #pkgs.libsoup_3
    ];
  };

}
