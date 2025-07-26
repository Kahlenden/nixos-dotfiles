{lib,...}:{
  dconf.settings = {
    # Set idle time until screen off
    "org/gnome/desktop/session" = {
      idle-delay = (lib.hm.gvariant.mkUint32 1500); # 25 minutes, or 1500 seconds
    };

    # Show battery percentage
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };

    # Set power button behavior
    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      idle-dim = false;
      sleep-inactive-ac-timeout = 1800;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
      sleep-inactive-battery-type = "suspend";
    };
  };
}
