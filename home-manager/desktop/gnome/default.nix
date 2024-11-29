{...}:{
  dconf.settings = {
    # Disable touchpad when plug mouse in
    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "disabled-on-external-mouse";
      two-finger-scrolling-enabled = true;
    };

    # Shortcuts customs
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
      home = ["<Super>e"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "/run/current-system/sw/bin/kitty";
      name = "Terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>b";
      command = "/run/current-system/sw/bin/mullvad-browser";
      name = "Default Browser";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Alt><Super>b";
      command = "/run/current-system/sw/bin/librewolf";
      name = "Librewolf Browser";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>c";
      command = "/run/current-system/sw/bin/codium";
      name = "Code";
    };

    # Set background
    "org/gnome/desktop/background" = {
      picture-uri = "file://${../backgrounds/bg1.jpg}";
      picture-uri-dark = "file://${../backgrounds/bg1.jpg}";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "Vitals@CoreCoding.com"
      ];
      favorite-apps = [
        "signal-desktop.desktop"
        "vesktop.desktop"
        "virt-manager.desktop"
        "librewolf.desktop"
        "mullvad-browser.desktop"
        "freetube.desktop"
        "net.lutris.Lutris.desktop"
      ];
    };

    # Blur-my-shell extension settings
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
    };

    # dash-to-dock extension settings
    "org/gnome/shell/etensions/dash-to-dock" = {
      background-opacity = 0.0;
      dash-max-icon-size = 43;
      dock-fixed = true;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      multi-monitor = true;
      preferred-monitor-by-connector = "eDP-1";
      show-trash = false;
      transparency-mode = "FIXED";
    };

    # Vitals extension settings
    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [
        "_storage_used_"
        "_memory_allocated_"
        "_processor_usage_"
        "__network-tx_max__"
        "__network-rx_max__"
      ];
    };
  };
}
