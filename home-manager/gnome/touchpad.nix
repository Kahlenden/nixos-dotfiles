{...}:{
  dconf.settings = {
    # Disable touchpad when plug mouse in
    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "enabled";#"disabled-on-external-mouse";
      two-finger-scrolling-enabled = true;
      natural-scroll = false;
      disable-while-typing = true;
    };
  };
}
