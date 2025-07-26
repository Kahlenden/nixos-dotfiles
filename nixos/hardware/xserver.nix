{...}:{
  # Xserver config
  services = {
    xserver = {
      enable = true;
      logFile = "/var/log/xorg.log";
    };

    # Doesn't matter, it seems like this configuration isn't effective (since we are using gnome mutter, which is wayland)
    libinput.touchpad = {
      #enable = true;
      tapping = true;
      naturalScrolling = true;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
      tappingDragLock = true;
      tappingButtonMap = "lrm";
      sendEventsMode = "disabled-on-external-mouse";
      scrollMethod = "twofinger";
    };
  };
}
