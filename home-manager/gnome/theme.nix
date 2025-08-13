{pkgs, ...}:{

  home.packages = with pkgs; [
    adwaita-icon-theme
    papirus-icon-theme
    morewaita-icon-theme
    adw-gtk3
    adwaita-qt
    #layan-cursors
    (pkgs.callPackage ../../nixos/packages/nierCursors {})
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";

    style = {
      name = "adwaita-dark";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
    };

    iconTheme = {
      name = "MoreWaita";
    };

    cursorTheme = {
      #name = "layan-cursors";
      name = "nier_cursors";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

}
