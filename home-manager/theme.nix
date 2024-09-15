{pkgs, ...}:{

  home.packages = with pkgs; [
    adwaita-icon-theme
    papirus-icon-theme
    morewaita-icon-theme
    adw-gtk3
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
      package = pkgs.adwaita-qt;
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
      #package = pkgs.gnome.gnome-themes-extra;
      #name = "Adwaita-dark";
    };

    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
      #name = "Adwaita";
      #package = pkgs.gnome.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "NieR Cursors";
      #package = (pkgs.callPackage ./nier_cursor.nix {});
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

}
