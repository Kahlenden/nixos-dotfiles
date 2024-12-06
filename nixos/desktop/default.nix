{inputs, pkgs, config, lib, ...}:{
  options = {
    gnome = {
      enable = lib.mkEnableOption "Gnome";
    };
    hyprland = {
      enable = lib.mkEnableOption "Hyprland";
    };
  };

  config = lib.mkMerge [
    # If hyprland then use hyprland and SDDM
    (lib.mkIf config.hyprland.enable {
      # Instead of requiring you to build Hyprland, they provide a Cachix cache that you can add to your Nix configuration.
      # https://wiki.hyprland.org/Nix/Cachix/
      nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      };

      environment.sessionVariables = {
        # if cursor invisible
        WLR_NO_HARDWARE_CURSOR = "1";
        # hint electron to use wayland
        NIXOS_OZONE_WL = "1";
      };

      programs = {
        hyprland = {
          enable = true;
          xwayland.enable = true;
          package = inputs.hyprland.packages.${pkgs.system}.hyprland;
          portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        };
      };

      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
        ];
      };

      services = {
        gvfs.enable = true;
        devmon.enable = true;
        udisks2.enable = true;
        upower.enable = true;
        power-profiles-daemon.enable = true;
        accounts-daemon.enable = true;
        gnome = {
          evolution-data-server.enable = true;
          glib-networking.enable = true;
          gnome-keyring.enable = true;
          gnome-online-accounts.enable = true;
        };
      };

      # SDDM configs
      environment.systemPackages = with pkgs;[
        (callPackage ./sddm-sugar-candy{})
        libsForQt5.qt5.qtgraphicaleffects
      ];

      services.displayManager.sddm = {
        enable = true;
        theme = "sugar-candy";
      };
    })

    # If gnome then use gnome and GDM
    (lib.mkIf config.gnome.enable {
      services.xserver.desktopManager.gnome.enable = true;
      services.xserver.displayManager.gdm.enable = true;
      services.gnome.core-os-services.enable = true;

      environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-dock
        vitals
        blur-my-shell
        appindicator
        screen-rotate
      ];

      services = {
        power-profiles-daemon.enable = true;
      };

      environment.gnome.excludePackages = with pkgs;[
        baobab
        epiphany
        gnome-text-editor
        gnome-calendar
        gnome-characters
        gnome-clocks
        gnome-console
        gnome-contacts
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        gnome-system-monitor
        gnome-weather
        gnome-connections
        simple-scan
        snapshot
        totem
        yelp
      ];
    })
  ];
}
