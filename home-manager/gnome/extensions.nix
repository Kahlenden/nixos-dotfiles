{...}:{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "Vitals@CoreCoding.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "screen-rotate@shyzus.github.io"
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
      preferred-monitor=-2;
      show-trash = false;
      show-mounts = false;
      show-running = false;
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
      icon-style = 1;
      position-in-panel = 0;
      update-time = 2;
    };

    # Screen rotate extension settings
    "org/gnome/shell/extensions/screen-rotate" = {
      flip-orientation = true;
      hide-lock-rotate = true;
      manual-flip = true;
    };
  };
}
