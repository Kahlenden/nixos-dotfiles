{...}:{
  networking.hostName = "Windows_11"; # Define your hostname.

  # NetworkManager
  programs.nm-applet = {
    enable = true;
    indicator = true;
  };
}
