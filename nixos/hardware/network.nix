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
      ethernet.macAddress = "random";
      connectionConfig = {
        "ipv4.dhcp-send-hostname" = 0;
        "ipv6.dhcp-send-hostname" = 0;
      };
    };
  };
}
