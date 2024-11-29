{...}:{
  networking = {
    hostName = "Windows_11"; # Define your hostname.

    networkmanager = {
      dhcp = "internal";
      enable = true;

      wifi = {
        scanRandMacAddress = true;
        macAddress = "random";
      };
      #ethernet.macAddress = "random";
    };
  };

  # NetworkManager
  programs.nm-applet = {
    enable = true;
    indicator = true;
  };
}
