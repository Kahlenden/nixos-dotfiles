{...}:{
  # Xserver config
  services = {
    xserver = {
      enable = true;
      logFile = "/var/log/xorg.log";
    };

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
